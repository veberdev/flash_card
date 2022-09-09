import { Controller } from '@hotwired/stimulus'
import axios from 'axios';

export default class extends Controller {
  static targets = ['update', 'questionTypeField', 'questionField', 
    'correctAnswerField', 'wrongAnswersFields']


  otherMethod() {
    console.log("javscript")
  }

  connect() {

    document.getElementById('update-question').click();

    this.updateTarget.addEventListener('click', (e) => {
      e.preventDefault();
      
      axios.get('/decks/1/questions/1', {
        params: {
        },
        headers: {
          'ACCEPT': 'aaplication/json'
        }
      }).then((response) => {
          let question = response.data.question
          document.getElementById('update-question').click();
          console.log("response then data: ", question)
          //console.log(this.questionTypeFieldTarget.value)
          //this.questionTypeFieldTarget.value = question.question_type
          //this.questionFieldTarget.value = question.question
          //this.correctAnswerFieldTarget.value = reponse.data.question.corrent_answer

         //pq nao funciona?: console.log("response then body: ", response.body)
        }).catch((response) => {
          console.log("error: ", response)
        })
    })
  }
}
