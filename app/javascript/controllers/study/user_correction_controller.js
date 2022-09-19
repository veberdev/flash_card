import { Controller } from '@hotwired/stimulus'
import { toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['nobtn', 'hiddenTextField', 'submitBtn']

  turnCard() {
    toggle(document.getElementById("questionBox"));
    toggle(document.getElementById("answerBox"));
  }
  
  connect() {
    this.nobtnTarget.addEventListener('click', (e) => {
      e.preventDefault();
      this.hiddenTextFieldTarget.value = ""
      this.submitBtnTarget.click();
    })
  }
}
