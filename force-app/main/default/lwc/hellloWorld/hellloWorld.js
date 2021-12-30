import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'Scouter';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}
