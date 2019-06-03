"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const utils_1 = require("./utils");
const base_1 = require("./base");
class VslsGuestService extends base_1.VslsBaseService {
    constructor(serviceProxy, peer) {
        super();
        this.serviceProxy = serviceProxy;
        this.peer = peer;
        serviceProxy.onNotify(utils_1.NOTIFICATION_NAME.message, (msg) => this.updateMessages(msg));
        if (serviceProxy.isServiceAvailable) {
            this.registerSelf();
        }
    }
    registerSelf() {
        // The host is not able to identify peers, because liveshare.peers
        // apparently returns stale data. Till then, we will use a registration
        // mechanism whenever a guest connects to the shared service
        this.serviceProxy.request(utils_1.REQUEST_NAME.registerGuest, [
            { peer: this.peer }
        ]);
    }
    isConnected() {
        return !!this.serviceProxy ? this.serviceProxy.isServiceAvailable : false;
    }
    async fetchUsers() {
        if (this.serviceProxy.isServiceAvailable) {
            const response = await this.serviceProxy.request(utils_1.REQUEST_NAME.fetchUsers, []);
            return response;
        }
        return Promise.resolve({});
    }
    async fetchUserInfo(userId) {
        if (this.serviceProxy.isServiceAvailable) {
            const response = await this.serviceProxy.request(utils_1.REQUEST_NAME.fetchUserInfo, [userId]);
            return response;
        }
    }
    async fetchMessagesHistory() {
        if (this.serviceProxy.isServiceAvailable) {
            const response = await this.serviceProxy.request(utils_1.REQUEST_NAME.fetchMessages, []);
            return response;
        }
        return Promise.resolve({});
    }
    async sendMessage(text, userId, channelId) {
        const payload = { text, userId };
        try {
            if (this.serviceProxy.isServiceAvailable) {
                await this.serviceProxy.request(utils_1.REQUEST_NAME.message, [payload]);
                return Promise.resolve();
            }
        }
        catch (error) {
            console.log("sending error", error);
        }
    }
}
exports.VslsGuestService = VslsGuestService;
//# sourceMappingURL=guest.js.map