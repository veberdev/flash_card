module Decks
  class StudyController < ApplicationController
    before_action :authenticate_user!

    def index
      @question = Question.find(1)
      #@question = Deck.find(params[:deck_id]).questions.to_study
    end

    def update
      @question.find(1).question_data.verify_question
    end

    private

    def verify_question
      if params[:user_answer] == @question.correct_answer
        @question.question_data.correct_times += 1 
      end
      @question.question_data.times_done += 1
      save!
    end
  end
end
