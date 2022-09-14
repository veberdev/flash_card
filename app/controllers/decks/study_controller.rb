module Decks
  class StudyController < ApplicationController
    before_action :authenticate_user!

    def index
       if quesiton_empty?
        redirect_to deck_questions_path
      else
        question_to_study
      end
    end

    def update
      @question_data = Question.find(params[:id]).question_data
      @question_data.update_data(params[:question][:correct_answer])
      redirect_to deck_study_index_path(params[:deck_id])
    end

    private

    def quesiton_empty?
      Deck.find(params[:deck_id]).questions.empty?
    end
    
    def question_to_study
      @question = Deck.find(params[:deck_id]).questions.to_study
    end
  end
end
