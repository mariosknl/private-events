class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    @current_user_id = session[:current_user_id]
    @current_user = User.find(@current_user_id) if @current_user_id
  end
end
