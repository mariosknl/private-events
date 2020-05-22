module ApplicationHelper
  def welcome_links
    @user = User.find(@current_user_id).name.upcase unless session[:current_user_id].nil?
    ('Welcome ' + @user) unless @current_user.nil?
  end

  def my_page_links
    (li_na = "My Events (#{@current_user.name})") unless session[:cid].nil?
    (cid = @current_user_id) unless session[:cid].nil?
    (link_to li_na, user_path(cid), class: 'nav-link') unless session[:cid].nil?
  end

  def sign_out_links
    if session[:current_user_id].nil?
      link_to 'Sign In', new_session_path, class: 'nav-link'
    else
      link_to 'Sign Out', session_path(@current_user_id), method: :delete, class: 'nav-link'
    end
  end

  def create_event_link
    link_to 'Create New Event', new_event_path, class: 'nav-link' unless session[:current_user_id].nil?
  end

  def events_calendar_link
    link_to 'Events Calendar', events_path, class: 'nav-link' unless session[:current_user_id].nil?
  end
end
