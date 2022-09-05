import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['questionTypeField'];

  connect() {
    console.log("question type field: ", this.questionTypeFieldTarget)
  }
}
