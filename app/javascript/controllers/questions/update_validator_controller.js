import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['questionTypeField' , 'questionField', 'correctAnswerField', 'submitBtn', 'wrongAnswersFields']

  connect() {
    this.submitBtnTarget.addEventListener('click', () => {
      if (this.questionFieldTarget.value == "") {
        this.questionFieldTarget.classList.add('border-red-500'); 
        this.questionFieldTarget.classList.remove('border-gray-300') 
      }
      if (this.correctAnswerFieldTarget.value == "") {
        this.correctAnswerFieldTarget.classList.add('border-red-500'); 
        this.correctAnswerFieldTarget.classList.remove('border-gray-300')
      }
      if (this.wrongAnswersFieldsTarget.childNodes[3].value == "" ) {
        this.wrongAnswersFieldsTarget.childNodes[3].classList.add('border-red-500');
        this.wrongAnswersFieldsTarget.childNodes[3].classList.remove('border-gray-300')
      }
      if (this.wrongAnswersFieldsTarget.childNodes[5].value == "" ) {
        this.wrongAnswersFieldsTarget.childNodes[5].classList.add('border-red-500'); 
        this.wrongAnswersFieldsTarget.childNodes[5].classList.remove('border-gray-300')
      }
      if (this.wrongAnswersFieldsTarget.childNodes[7].value == "" ) {
        this.wrongAnswersFieldsTarget.childNodes[7].classList.add('border-red-500'); 
        this.wrongAnswersFieldsTarget.childNodes[7].classList.remove('border-gray-300')
      }
    })
  }
}