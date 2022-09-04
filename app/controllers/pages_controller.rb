class PagesController < ApplicationController
  before_action :user_logged_in?

  def index
    @user = User.first
  end

  private

  def user_logged_in?
    redirect_to dashboard_index_path if current_user.present?
  end
end
