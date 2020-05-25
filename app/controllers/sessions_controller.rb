class SessionsController < ApplicationController
  def new
    @names = User.all
    @user = User.new
  end

  def create
    @name = params[:user][:name]
    @user = User.new(name: @name)
    if User.find_by(name: @name).nil?
      @names = User.all
      render :new
    else
      @id = User.find_by(name: @name).id
      session[:current_user_id] = @id
      redirect_to user_path(@id)
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
