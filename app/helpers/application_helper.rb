module ApplicationHelper
  def welcome_links
    @username = User.find(@current_user_id).name.upcase unless session[:current_user_id].nil?
  end

  def my_page_links
    link_to "My Events (#{@current_user.name})", user_path(@current_user_id) unless session[:current_user_id].nil?
  end

  def sign_out_links
    if session[:current_user_id].nil?
      link_to 'Sign In', sessions_new_path
    else
      link_to 'Sign Out', sessions_destroy_path
    end
  end

  def create_event_link
    link_to '| Create New Event', new_event_path unless session[:current_user_id].nil?
  end

  def events_calendar_link
    link_to '| Events Calendar', events_path unless session[:current_user_id].nil?
  end
end
