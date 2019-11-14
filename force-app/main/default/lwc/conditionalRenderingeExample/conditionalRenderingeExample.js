import { LightningElement,track } from 'lwc';

export default class ConditionalRenderingeExample extends LightningElement {
@track displayDiv = false;

@track cityList = ['New York', 'San Jose', 'SFO', 'Denver','Las Vegas'];
showDivHandler(event){
    this.displayDiv= event.target.checked;
}
}