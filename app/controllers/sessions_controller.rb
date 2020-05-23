class SessionsController < ApplicationController
  def new
    @users = User.all
    @user = User.new
  end

  def create
    @name = params[:user][:name]
    @user = User.new(name: @name)
    if User.find_by(name: @name)
      @id = User.find_by(name: @name).id
      session[:current_user_id] = @id
      redirect_to root_path
    else
      render :new
    end
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
