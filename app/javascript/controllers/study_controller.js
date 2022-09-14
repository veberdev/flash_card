import { Controller } from '@hotwired/stimulus'
import { isEmpty } from 'lodash-es';

export default class extends Controller {
  static targets = ['render', 'inputField', 'toSubmitField', 'submitBtn', 'form', 'panel']

  connect() {

    this.inputFieldTargets.forEach(element => {
      element.addEventListener('click', (e) => {
        this.toSubmitFieldTarget.value = e.target.value;
      })
    })

    this.submitBtnTarget.addEventListener('click', (e) => {
      e.preventDefault();
      if (isEmpty(this.toSubmitFieldTarget.value)) {
        shake(this.renderTarget);
        this.panelTarget.classList.add('border-red-500')
      } else {
        this.formTarget.submit();
      }
    })

    var shake = function (element, magnitude = 16, angular = false) {
      var tiltAngle = 1;
      var counter = 1;
      var numberOfShakes = 15;
      var startX = 0,
          startY = 0,
          startAngle = 0;
      var magnitudeUnit = magnitude / numberOfShakes;
      var randomInt = (min, max) => {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      };
      upAndDownShake();

      function upAndDownShake() {
        if (counter < numberOfShakes) {
          element.style.transform = 'translate(' + startX + 'px, ' + startY + 'px)';
          magnitude -= magnitudeUnit;
          var randomX = randomInt(-magnitude, magnitude);
          var randomY = randomInt(-magnitude, magnitude);
          element.style.transform = 'translate(' + randomX + 'px, ' + randomY + 'px)';
          counter += 1;
          requestAnimationFrame(upAndDownShake);
        }
        if (counter >= numberOfShakes) {
          element.style.transform = 'translate(' + startX + ', ' + startY + ')';
        }
      }
    };

  }
}
