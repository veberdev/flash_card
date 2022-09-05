import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['createNew']
  connect() {
    this.createNewTarget.addEventListener('click', (e) => {
      console.log("aaa")
      e.preventDefault(e);
      document.getElementById('new-question').click();
    })
  }
}
