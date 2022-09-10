import { Controller } from '@hotwired/stimulus'
import { enter, leave } from 'el-transition'
import axios from 'axios';

export default class extends Controller {
  static targets = ['createNew', 'update', 'questionTypeField', 'questionField', 
    'correctAnswerField', 'wrongAnswersFields' ]

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

              if (question.question_type == 'user_correction') {
                leave(this.wrongAnswersFieldsTarget);
              } else {
                this.wrongAnswersFieldsTarget.childNodes[3].value = question.wrong_answer_n1
                this.wrongAnswersFieldsTarget.childNodes[5].value = question.wrong_answer_n2
                this.wrongAnswersFieldsTarget.childNodes[7].value = question.wrong_answer_n3
              }

              document.getElementById("form-update").action = `questions/${target.id}`
            }).catch((response) => {
              console.log("error: ", response)
            })
        })
      };
    }
  }
