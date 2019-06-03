# Changelog

All notable changes to the vscode-chat extension will be documented in this file. This follows the [Keep a Changelog](http://keepachangelog.com/) format.

## [0.15.1] - 2019-05-12

### Fixed

- Fixes unwanted notification for Slack/Discord login when installed alongside VS Live Share.

## [0.15.0] - 2019-05-01

### Removed

- Removed onboarding tree view that would show Slack icon when no chat backend was configured.

## [0.14.0] - 2019-04-28

### Added

- Faster installation and startup times with Webpack bundling.
- Updated setup instructions for Discord to call out potential ToS violation. 

## [0.13.0] - 2019-04-09

### Fixed

- Fixes an issue where Live Share Chat would not work for guests on the collaboration session.

## [0.12.0] - 2019-02-24

### Added

- New configuration option to disable auto-launching the Live Share Chat window on a new Live Share session: `"chat.autoLaunchLiveShareChat": false`.

## [0.11.0] - 2019-02-03

### Added

- The VS Live Share chat window now shows up automatically for new VS Live Share sessions.

## [0.10.0] - 2019-01-21

### Added

- Added support for multiple workspaces in Slack. Run the `Sign in with Slack` command to add new workspaces; Use the tree view to change between Slack workspaces.

### Fixed

- Render attachments in Discord messages.
- Usability improvements in selecting which Slack channels should be shown.

## [0.9.2] - 2019-01-04

### Fixed

- "Account is required" errors while accessing the system keychain.

## [0.9.1] - 2018-12-31

### Fixed

- CPU load: Removed redundant extension activation events that were causing high CPU load.

## [0.9.0] - 2018-12-16

### Added

- Chat over VS Live Share now works alongside Slack and Discord: You can now chat with your collaboration session peers through VS Live Share, even if you are logged in on other chat providers.
- Start chat over VS Live Share from the explorer view.

## [0.8.2] - 2018-11-20

### Fixed

- VS Live Share integration: Updated label for chat tree item.

## [0.8.1] - 2018-11-20

### Fixed

- Inviting online users to a Live Share session creates an IM channel with the user, if not already available.

## [0.8.0] - 2018-11-18

### Added

- Now you can update your presence status: go invisible on chat, or turn on do-not-disturb mode. Run the `Chat: Update your presence status` command (supports Slack and Discord).
- VS Live Share integrations:
  - Show presence statuses for VS Live Share suggested contacts (for Slack and Discord)
  - Update your presence status from inside VS Live Share (for Slack and Discord)
  - Open VS Live Share chat from the VS Live Share explorer views

## [0.7.4] - 2018-11-05

### Fixed

- Fixed bad instantiation for users and channels state causing VS Live Share chat to not work.

## [0.7.3] - 2018-10-16

### Fixed

- Fixed channel loading for Slack workspaces that cross the user limit.

## [0.7.2] - 2018-10-15

### Fixed

- Fixed onboarding notification for Live Share users.

## [0.7.1] - 2018-10-15

### Added

- Chat over VS Live Share RPC is the default backend for users that have the Live Share extension. Users can optionally upgrade to Slack or Discord.
- New status bar item to open the chat window during a VS Live Share session.
- Unread message notification and user joined/left info messages for Live Share chat.

### Fixed

- Slack messages are sent over websocket, to not count towards http rate limits.
- Limit Slack channels to relevant channels only, by using the Slack conversations API.

## [0.7.0] - 2018-10-11

### Added

- Chat with VS Live Share session participants, without relying on a chat backend like Slack/Discord. To use this, start a Live Share session and run the `Chat with VS Live Share participants` command.

## [0.6.3] - 2018-10-09

### Added

- Added token validation for manual entry for Slack and Discord tokens.
- Keychain access operations can now be retried in case access is denied.
- Added workspace name to the status item notification.

## [0.6.2] - 2018-09-28

### Fixed

- Handle deactivated Slack users, and not show their direct messages and groups (thanks [Tristan Partin](https://github.com/tristan957)).
- Private channels are now shown under the Channels view, and not Groups.

## [0.6.1] - 2018-09-22

### Fixed

- Fixed migration condition for pre-0.6.x installations (thanks [ACharLuk](https://github.com/acharluk)).

## [0.6.0] - 2018-09-21

### Added

- Added support for Discord as a chat provider, in addition to Slack.
- [Breaking] Commands are now namespaced as "Chat: ...", instead of "Slack: ...".
- Updates to extension metadata and readme: the extension is now called Team Chat.

## [0.5.11] - 2018-09-18

### Added

- Added support for replying to thread messages.

### Fixed

- Fixed rendering of duplicate thread replies.

## [0.5.10] - 2018-09-17

### Added

- Added new configuration `chat.rejectTlsUnauthorized` for self-signed certificate users (thanks [Seth Bromberger](https://github.com/sbromberger)).
- Load vue.js assets locally, removing dependency on the jsdelivr CDN.
- Upgraded Slack dependency to keep up with the network library improvements upstream.

## [0.5.9] - 2018-09-04

### Added

- Support for muted channels: new messages in muted channels do not update the unread count.
- Added support to expand thread messages to render replies, with text and file attachments.
- Consistency between Slack clients for unread counts: marking messages as read from other Slack clients will update the unread count.
- Unread messages are now highlighted in the webview.
- Added documentation for [product roadmap](https://github.com/karigari/vscode-chat/blob/master/VISION.md) and [adding chat providers](https://github.com/karigari/vscode-chat/blob/master/docs/PROVIDERS.md).

### Fixed

- The unread count does not include alerts for users joining/leaving channels anymore.

## [0.5.8] - 2018-08-31

### Added

- Added support for the system keychain to store authentication tokens.
- Added a new command to sign out from Slack.

### Fixed

- Fix handling of composition start/end events while composing messages (thanks [Yukai Huang](https://github.com/Yukaii)).
- Opening Slack or changing channel without authentication now prompts users to authenticate.

## [0.5.7] - 2018-08-29

### Added

- Added support for "Sign in with Slack" from the activity bar.

### Fixed

- New line characters in messages are rendered correctly.
- Date separators show the correct month string.
- Fixed event source property for webview telemetry.

## [0.5.6] - 2018-08-23

### Added

- Slack webview font size now matches the font size of your editor.
- Introductory support for message threads: historical messages show the number of thread replies. Future releases will build on this to add full thread replies support.
- Added anonymized telemetry data collection; this respects the telemetry setting in your editor and you can opt-out by setting `telemetry.enableTelemetry` to false.

### Fixed

- Updated user display names to be consistent with Slack clients.

## [0.5.5] - 2018-08-20

### Added

- Added a fallback for "Sign in with Slack" for situations where the system-level URI scheme handler fails.

## [0.5.4] - 2018-08-18

### Added

- Added "Sign in with Slack" for an easier onboarding experience

## [0.5.3] - 2018-08-18

### Fixed

- Fixed issues with duplicated state when configuration gets changed in the editor.
- Fixed unread message notifications for messages with files.

## [0.5.2] - 2018-08-18

### Fixed

- Fixed date separators computation for local time zones
- Fixed a race condition where loading channel message history would assign messages to an incorrect channel.

## [0.5.1] - 2018-08-16

### Fixed

- Fixed extension activation for the VS Live Share activity bar.

## [0.5.0] - 2018-08-16

### Added

- Sidebar view to show channels, private groups and direct messages.
- Support to show user presence (online/offline) in the sidebar view.
- Better integration with VS Live Share: one-click action to invite users or channels to your collaboration session.
- Minor improvements to extension setup for first-time users.

### Fixed

- Fixed a case where the unread count would get updated incorrectly.

## [0.4.10] - 2018-08-14

### Added

- Slack username tags in messages are not cryptic anymore.
- Better keyboard-only support: pressing tab will focus the input text box, ignoring other selectable HTML elements in the webview.
- Added date separators on the messages UI

### Fixed

- Fixed real-time UI updates for bot messages.
- Fixed select-all behaviour through the cmd+A keybinding (needs VS Code 1.26+).

## [0.4.9] - 2018-08-13

### Fixed

- Fixed issue where new messages were not getting updated on the UI.

## [0.4.8] - 2018-08-09

### Added

- Added support to render message reactions, and live update UI as reactions are added or removed
- The unread count now also reflects messages that were received before the extension gets activated, by calling the relevant Slack API.

### Fixed

- Messages with files were not rendered correctly since the last Slack update. This has been fixed now.

## [0.4.7] - 2018-08-08

### Added

- Added a status bar item to show the number of new/unread messages. For now, this is available only after the chat panel has been opened once.

## [0.4.6] - 2018-08-08

### Added

- Added support for marking messages as read
- Improved how multi-party DM group name are shown in the UI

## [0.4.5] - 2018-07-21

### Added

- Added support for network connections via proxies. To setup, add the `chat.proxyUrl` configuration.

## [0.4.4] - 2018-07-17

### Fixed

- Fixed demo gif on the Visual Studio Marketplace

## [0.4.3] - 2018-07-17

### Added

- Open Travis CI logs inside the editor, with the new extensible Providers support. New providers can be create for other Slack bots and integrations.
- New demo gifs and examples in the README.

### Fixed

- Fixed an issue where messages from a previously opened Slack channel would show up in the current view.

## [0.4.2] - 2018-07-15

### Fixed

- Fixed the change channel quick-pick prompt for workspaces that invite guest users.

## [0.4.1] - 2018-07-06

### Added

- Add a "reload channels" option to the channel switcher which refreshes the user/channels list from Slack API.

## [0.4.0] - 2018-07-06

### Added

- Adds "reverse initiation" for VS Live Share: a user can ask another user to host a Live Share session by sending the `/live request` command. The recipient can choose to accept the request, which would kickstart the shared session.

## [0.3.4] - 2018-07-04

### Fixed

- Fixes a bug that showed new messages sent via the extension as blank

## [0.3.3] - 2018-07-03

### Added

- Support for rendering file attachments, code snippets, multi-line messages
- Support for rendering Slack app messages, with author, title, coloured border, and footer
- Support for rendering message edits and deletions

### Fixed

- Fixed click behaviour for links inside messages
