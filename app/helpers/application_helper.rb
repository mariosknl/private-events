module ApplicationHelper
  def welcome_links
    if @current_user.nil?
      'Stranger'
    else
      @username = User.find(@current_user_id).name.upcase unless session[:current_user_id].nil?
    end
  end

  def my_page_links
    link_to "My Events (#{@current_user.name})", user_path(@current_user_id) unless session[:current_user_id].nil?
  end

  def sign_out_links
    if session[:current_user_id].nil?
      link_to 'Sign In', new_session_path, class: 'nav-link'
    else
      link_to 'Sign Out', session_path(@current_user_id), method: :delete, class: 'nav-link'
    end
  end

  def create_event_link
    link_to '| Create New Event', new_event_path unless session[:current_user_id].nil?
  end

  def events_calendar_link
    link_to '| Events Calendar', events_path unless session[:current_user_id].nil?
  end
end
