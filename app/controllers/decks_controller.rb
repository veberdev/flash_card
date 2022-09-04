class DecksController < ApplicationController
  before_action :authenticate_user!
  
  def show 
    @deck = Deck.find(params[:id]) 
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(deck_params)

    if @deck.save 
      redirect_to dashboard_index_path 
    else
      render :new
    end

  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(deck_params)
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :description, :deck_image)
  end
end
