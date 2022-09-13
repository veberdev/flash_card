import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['render', 'inputField', 'toSubmitField']

  connect() {
    console.log("im here at study controller")

    this.inputFieldTargets.forEach(element => {
      element.addEventListener('click', (e) => {
        console.log(this.toSubmitFieldTarget)
        this.toSubmitFieldTarget.innerHTML = e.target.value;
        this.toSubmitFieldTarget.value = e.target.value;
      })
    })
  }
}
