import { Controller } from '@hotwired/stimulus'
import axios from 'axios';

export default class extends Controller {
  static targets = ['createNew']


  connect() {
              
    this.createNewTarget.addEventListener('click', (e) => {
      e.preventDefault(e);
      document.getElementById('new-question').click();
    })

  }
}
