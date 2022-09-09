module Decks 
  class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
      @questions = Deck.find(params[:deck_id]).questions
    end

    def new
      @question = Question.new
    end

    def create
      @question = Deck.find(params[:deck_id]).questions.create(
          question: params[:question], 
          correct_answer: params[:correct_answer], 
          wrong_answers: params[:wrong_answers], 
          question_type: params[:question_type])

      if @question.save
        redirect_to deck_questions_path(params[:deck_id])
      else
        redirect_to root_path 
      end
    end
    
    def show
      
      @question = Question.find(1)

    end

    def update

    end

    def destroy

    end

    private

    def question_params
      params.permit(:question, :correct_answer, :wrong_answers, :question_type, :deck_id, :controller, :question_id)
    end
  end
end
