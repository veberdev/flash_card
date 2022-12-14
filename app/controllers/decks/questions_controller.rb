module Decks
  class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
      @questions = Deck.find(params[:deck_id]).questions.order(:created_at).page(params[:page])
    end

    def new
      @question = Question.new
    end

    def create
      @question = Deck.find(params[:deck_id]).questions.create(question_params)

      if @question.save
        redirect_to deck_questions_path(params[:deck_id])
      else
        head :unprocessable_entity
      end
    end

    def show
      @question = Question.find(params[:id])
    end

    def update
      @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to deck_question_path(params[:deck_id])
      else
        head :unprocessable_entity
      end
    end

    def destroy; end

    private

    def question_params
      params.permit(:question, :correct_answer, :question_type, :wrong_answer_n1, :wrong_answer_n2, :wrong_answer_n3)
    end
  end
end
