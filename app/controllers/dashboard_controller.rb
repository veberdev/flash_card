class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @decks = current_user.decks.order(:created_at).page(params[:page])
  end
end
