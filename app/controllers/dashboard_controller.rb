class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    binding.pry
  end

end
