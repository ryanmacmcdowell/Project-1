import { LightningElement } from 'lwc';

export default class LightningExampleAccordionBasic extends LightningElement {
    activeSectionMessage = '';

    handleToggleSection(event) {
        this.activeSectionMessage =
            'Get to Know Us!';
    }

    handleSetActiveSectionC() {
        const accordion = this.template.querySelector('.example-accordion');

        accordion.activeSectionName = 'A';
    }
}
