class SessionsController < ApplicationController
  def new
    @id = params[:format]
    session[:current_user_id] = @id
    redirect_to root_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
