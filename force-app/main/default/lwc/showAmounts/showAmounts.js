import { LightningElement, api } from 'lwc';
import { FlowNavigationBackEvent, FlowNavigationNextEvent } from 'lightning/flowSupport';
import IMAGE from "@salesforce/resourceUrl/CurrencyImage";

export default class ShowAmounts extends LightningElement {
    @api amountInEuro;
    @api amountInUsd;

    currencyImage = IMAGE;

    handleNext() {
        this.dispatchEvent(
            new FlowNavigationNextEvent()
        );
    }

    handleBack() {
        this.dispatchEvent(
            new FlowNavigationBackEvent()
        );
    }
}