module ApplicationHelper
  def welcome_links
    @user = User.find(@current_user_id).name.upcase unless session[:current_user_id].nil?
    ('Welcome ' + @user) unless @current_user.nil?
  end

  def my_page_links
    return if session[:current_user_id].nil?

    link_to "My Events (#{@current_user.name})", user_path(@current_user_id), class: 'nav-link text-light'
  end

  def sign_out_links
    if session[:current_user_id].nil?
      link_to 'Sign In', new_session_path, class: 'nav-link text-light'
    else
      link_to 'Sign Out', session_path(@current_user_id), method: :delete, class: 'nav-link text-light'
    end
  end

  def create_event_link
    link_to 'Create New Event', new_event_path, class: 'nav-link text-light' unless session[:current_user_id].nil?
  end

  def events_calendar_link
    link_to 'Events Calendar', events_path, class: 'nav-link text-light' unless session[:current_user_id].nil?
  end
end
