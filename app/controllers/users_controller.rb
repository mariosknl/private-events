class UsersController < ApplicationController
  before_action :current_user

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events

    @upcoming_events = @user.attended_events.upcoming_events
    @prev_events = @user.attended_events.prev_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def current_user
    @current_user_id = session[:current_user_id]
    @current_user = User.find(@current_user_id) if @current_user_id
  end
end
