import { Controller } from '@hotwired/stimulus'
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {

  connect() {
    document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`).addEventListener('click', (event) => {
      this.closeModal(event, this.element.dataset.modalTriggerId)
    });
  }

  closeModal(event, triggerId) {
    const modalPanelClicked = document.getElementById(`modal-${triggerId}-panel`).contains(event.target);

    if (!modalPanelClicked && event.target.id !== triggerId) {
      leave(document.getElementById(`modal-${triggerId}-wrapper`));
      leave(document.getElementById(`modal-${triggerId}-backdrop`));
      leave(document.getElementById(`modal-${triggerId}-panel`));
    }
  }

  showModal() {
    enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-wrapper`));
    enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-backdrop`));
    enter(document.getElementById(`modal-${this.element.dataset.modalTriggerId}-panel`));
  }
}
