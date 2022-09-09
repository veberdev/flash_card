import { Controller } from '@hotwired/stimulus'
import axios from 'axios';

export default class extends Controller {
  static targets = ['createNew', 'update', 'questionTypeField', 'questionField', 
    'correctAnswerField', 'wrongAnswersFields', 'submit' ]

  connect() {
            
    this.createNewTarget.addEventListener('click', (e) => {
      e.preventDefault(e);
      document.getElementById('new-question').click();
    })
    
      for (var i in this.updateTargets) {
        let target = this.updateTargets[i]
        target.addEventListener('click', (e) => {
          e.preventDefault();

          axios.get(`questions/${target.id}`, {
            params: {
            },
            headers: {
              'ACCEPT': 'aaplication/json'
            }
          }).then((response) => {
              let question = response.data.question
              document.getElementById('update-question').click();
              this.questionTypeFieldTarget.value = question.question_type
              this.questionFieldTarget.value = question.question
              this.correctAnswerFieldTarget.value = question.correct_answer
              this.wrongAnswersFieldsTarget.childNodes[3].value = question.wrong_answers[0]
              this.wrongAnswersFieldsTarget.childNodes[5].value = question.wrong_answers[1]
              this.wrongAnswersFieldsTarget.childNodes[7].value = question.wrong_answers[2]

              document.getElementById("form-update").action = `questions/${target.id}`
             // document.getElementById("form-update").action = `${location.pathname.substring(1)}/${target.id}`

            }).catch((response) => {
              console.log("error: ", response)
            })
        })
      };
    }
  }
