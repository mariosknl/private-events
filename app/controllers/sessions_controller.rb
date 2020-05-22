class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @name = params[:user][:name]
    @id = User.find_by(name: @name)
    session[:current_user_id] = @id
    redirect_to root_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private

  def user_sign_in_params
    params.require(:user).permit(:name)
  end
end
