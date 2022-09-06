import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  openDeckDescriptionModal(e) {
    e.preventDefault();
    console.log("im here at deck controller js")
    console.log("event param: ", event.params)
  }
}

