import { Controller } from '@hotwired/stimulus'
import { enter, leave } from 'el-transition'

export default class extends Controller {
  static targets = ['questionTypeField', 'questionField', 'correctAnswerField', 'wrongAnswersFields', 'submitBtn'];

  connect() {
    this.questionTypeFieldTarget.addEventListener('change', () => {
      if (this.questionTypeFieldTarget.value == 'user_correction') {
        this.wrongAnswersFieldsTarget.childNodes[3].value = ""
        this.wrongAnswersFieldsTarget.childNodes[5].value = ""
        this.wrongAnswersFieldsTarget.childNodes[7].value = ""
        leave(this.wrongAnswersFieldsTarget);
      } else {
        enter(this.wrongAnswersFieldsTarget);
      }
    })

    // FORM VALIDATOR
    //
    this.submitBtnTarget.addEventListener('click', () => {
        if (this.questionFieldTarget.value == "") {this.questionFieldTarget.classList.add('border-red-500')}
        if (this.correctAnswerFieldTarget.value == "") {this.correctAnswerFieldTarget.classList.add('border-red-500')}
        if (this.wrongAnswersFieldsTarget.childNodes[3].value == "" ) {this.wrongAnswersFieldsTarget.childNodes[3].classList.add('border-red-500')}
        if (this.wrongAnswersFieldsTarget.childNodes[5].value == "" ) {this.wrongAnswersFieldsTarget.childNodes[5].classList.add('border-red-500')}
        if (this.wrongAnswersFieldsTarget.childNodes[7].value == "" ) {this.wrongAnswersFieldsTarget.childNodes[7].classList.add('border-red-500')}
    })
  }
}
