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
      signed_in? ? redirect_to(new_user_path) : create_session_and_redirect(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(current_user_id)
    @events = @user.events.order(date: :desc)

    @upcoming_events = @user.attended_events.upcoming_events
    @prev_events = @user.attended_events.prev_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
