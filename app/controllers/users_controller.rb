class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user = User.find_by(name: @user.name)
      redirect_to new_user_path
      # render 'sessions/new' unless signed_in?
    else
      render :new
    end
  end

  def show
    @user = User.find(current_user_id)
    @events = @user.events

    @upcoming_events = @user.attended_events.upcoming_events
    @prev_events = @user.attended_events.prev_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
