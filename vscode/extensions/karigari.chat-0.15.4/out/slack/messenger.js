"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const client_1 = require("@slack/client");
const config_1 = require("../config");
const client_2 = require("./client");
const constants_1 = require("../constants");
const RTMEvents = {
    AUTHENTICATED: "authenticated",
    MESSAGE: "message",
    ERROR: "unable_to_rtm_start",
    REACTION_ADDED: "reaction_added",
    REACTION_REMOVED: "reaction_removed",
    PRESENCE_CHANGE: "presence_change",
    CHANNEL_MARKED: "channel_marked",
    GROUP_MARKED: "group_marked",
    IM_MARKED: "im_marked",
    DND_UPDATED_SELF: "dnd_updated",
    DND_UPDATED_USER: "dnd_updated_user"
};
const EventSubTypes = {
    EDITED: "message_changed",
    DELETED: "message_deleted",
    REPLIED: "message_replied"
};
class SlackMessenger {
    constructor(token, onPresenceChanged, onDndStateChanged) {
        this.onPresenceChanged = onPresenceChanged;
        this.onDndStateChanged = onDndStateChanged;
        this.start = () => {
            return new Promise((resolve, reject) => {
                this.rtmClient.once(RTMEvents.AUTHENTICATED, response => {
                    const { ok, team, self } = response;
                    if (ok) {
                        const { id, name } = self;
                        const { id: teamId, name: teamName } = team;
                        return resolve({
                            id,
                            name,
                            teams: [{ id: teamId, name: teamName }],
                            currentTeamId: teamId,
                            provider: "slack" /* slack */
                        });
                    }
                });
                this.rtmClient.once(RTMEvents.ERROR, error => {
                    return reject(error);
                });
                // Note, rtm.start is heavily rate-limited
                this.rtmClient.start();
            });
        };
        this.sendMessage = (channelId, text) => {
            return this.rtmClient.sendMessage(text, channelId);
        };
        this.handleMessageLinks = (incoming) => {
            const messageTs = Object.keys(incoming)[0];
            const message = incoming[messageTs];
            let { text, userId } = message;
            let uri;
            if (text.startsWith("<") && text.endsWith(">")) {
                text = text.substring(1, text.length - 1); // Strip link symbols
            }
            try {
                if (text.startsWith("http")) {
                    uri = vscode.Uri.parse(text);
                    vscode.commands.executeCommand(constants_1.SelfCommands.HANDLE_INCOMING_LINKS, {
                        provider: "slack",
                        senderId: userId,
                        uri
                    });
                }
            }
            catch (err) { }
        };
        this.subscribePresence = (users) => {
            this.rtmClient.subscribePresence(Object.keys(users));
        };
        // We can also use { useRtmConnect: false } for rtm.start
        // instead of rtm.connect, which has more fields in the payload
        let options = {};
        const customAgent = config_1.ConfigHelper.getCustomAgent();
        if (!!customAgent) {
            options.agent = customAgent;
        }
        this.rtmClient = new client_1.RTMClient(token, options);
        this.rtmClient.on(RTMEvents.MESSAGE, event => {
            const { subtype } = event;
            let newMessages = {};
            switch (subtype) {
                case EventSubTypes.DELETED:
                    const { deleted_ts } = event;
                    newMessages[deleted_ts] = undefined;
                    break;
                case EventSubTypes.EDITED:
                    const { message } = event;
                    newMessages = Object.assign({}, client_2.getMessage(message));
                    break;
                case EventSubTypes.REPLIED:
                    // We ignore this type, since these events also show up as normal messages
                    // TODO: We might want to use some of these types (copied over from Slack docs):
                    // "You may also notice thread_subscribed, thread_unsubscribed, thread_marked update_thread_state event types"
                    break;
                default:
                    const { text, attachments, files, thread_ts, ts } = event;
                    if (!!thread_ts && !!ts && thread_ts !== ts) {
                        // This is a thread reply
                        const { user, text, channel } = event;
                        const reply = {
                            userId: user,
                            timestamp: ts,
                            text
                        };
                        vscode.commands.executeCommand(constants_1.SelfCommands.UPDATE_MESSAGE_REPLIES, {
                            parentTimestamp: thread_ts,
                            channelId: channel,
                            reply,
                            provider: "slack"
                        });
                    }
                    else {
                        const hasAttachment = attachments && attachments.length > 0;
                        const hasFiles = files && files.length > 0;
                        if (!!text || hasAttachment || hasFiles) {
                            const message = client_2.getMessage(event);
                            newMessages = Object.assign({}, newMessages, message);
                            this.handleMessageLinks(message);
                        }
                    }
            }
            // On sending messages, this also gets called, which means we
            // send duplicate messages to the webview.
            vscode.commands.executeCommand(constants_1.SelfCommands.UPDATE_MESSAGES, {
                channelId: event.channel,
                messages: newMessages,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.REACTION_ADDED, event => {
            const { user: userId, reaction: reactionName, item } = event;
            const { channel: channelId, ts: msgTimestamp } = item;
            vscode.commands.executeCommand(constants_1.SelfCommands.ADD_MESSAGE_REACTION, {
                userId,
                channelId,
                msgTimestamp,
                reactionName,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.REACTION_REMOVED, event => {
            const { user: userId, reaction: reactionName, item } = event;
            const { channel: channelId, ts: msgTimestamp } = item;
            vscode.commands.executeCommand(constants_1.SelfCommands.REMOVE_MESSAGE_REACTION, {
                userId,
                channelId,
                msgTimestamp,
                reactionName,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.CHANNEL_MARKED, event => {
            const { channel, ts, unread_count_display } = event;
            vscode.commands.executeCommand(constants_1.SelfCommands.CHANNEL_MARKED, {
                channelId: channel,
                readTimestamp: ts,
                unreadCount: unread_count_display,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.GROUP_MARKED, event => {
            const { channel, ts, unread_count_display } = event;
            vscode.commands.executeCommand(constants_1.SelfCommands.CHANNEL_MARKED, {
                channelId: channel,
                readTimestamp: ts,
                unreadCount: unread_count_display,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.IM_MARKED, event => {
            const { channel, ts, unread_count_display } = event;
            vscode.commands.executeCommand(constants_1.SelfCommands.CHANNEL_MARKED, {
                channelId: channel,
                readTimestamp: ts,
                unreadCount: unread_count_display,
                provider: "slack"
            });
        });
        this.rtmClient.on(RTMEvents.PRESENCE_CHANGE, event => {
            const { user: userId, presence: rawPresence } = event;
            this.onPresenceChanged(userId, rawPresence);
        });
        this.rtmClient.on(RTMEvents.DND_UPDATED_SELF, event => {
            // This is a no-op, since the DND_UPDATED_USER handler does everything
            const { user: userId } = event;
            const dndStatus = event.dnd_status;
        });
        this.rtmClient.on(RTMEvents.DND_UPDATED_USER, event => {
            // This event is not fired when the snooze ends for a user
            // Hence, we need to maintain that via dnd timers
            const { user: userId } = event;
            const dndStatus = event.dnd_status;
            this.onDndStateChanged(userId, dndStatus);
        });
    }
    isConnected() {
        return !!this.rtmClient && this.rtmClient.connected;
    }
    disconnect() {
        if (!!this.rtmClient) {
            return this.rtmClient.disconnect();
        }
    }
}
exports.default = SlackMessenger;
//# sourceMappingURL=messenger.js.map