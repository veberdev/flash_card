import { Controller } from '@hotwired/stimulus'
import { enter, leave } from 'el-transition'

export default class extends Controller {
  static targets = ['questionTypeField', 'wrongAnswersFields'];

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


  }
}
