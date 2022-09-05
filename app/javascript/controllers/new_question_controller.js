import { Controller } from '@hotwired/stimulus'
import { enter, leave } from 'el-transition'

export default class extends Controller {
  static targets = ['questionTypeField', 'wrongAnswersFields'];

  connect() {
    this.questionTypeFieldTarget.addEventListener('change', () => {
      if (this.questionTypeFieldTarget.value == 'user_correction') {
        leave(this.wrongAnswersFieldsTarget);
      } else {
        enter(this.wrongAnswersFieldsTarget);
      }
    })
  }
}
