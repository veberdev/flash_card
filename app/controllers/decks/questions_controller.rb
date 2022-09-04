module Decks 
  class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
      @questions = Deck.find(1).questions
    end

    def new
      @question = Question.new
    end

    def create

      @questions = Deck.find(1)
    end

    def update

    end

    def destroy

    end

    private

    def questions_params
      params.require(:question, :correct_answer, :wrong_answers)
    end
  end
end
