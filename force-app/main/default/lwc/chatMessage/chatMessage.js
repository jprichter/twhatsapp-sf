import { LightningElement, api } from 'lwc';

export default class ChatMessage extends LightningElement {
    @api inbound;
    @api message;
    liCss = 'slds-chat-listitem slds-chat-listitem_inbound';
    msgCss = 'slds-chat-message__text slds-chat-message__text_inbound';

    connectedCallback() {
        if (!this.inbound) {
            this.liCss = 'slds-chat-listitem slds-chat-listitem_outbound';
            this.msgCss = 'slds-chat-message__text slds-chat-message__text_outbound';
        }
    }

}