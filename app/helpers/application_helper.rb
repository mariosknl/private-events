module ApplicationHelper
  def welcome_links
    ('Welcome ' + current_user.name) if signed_in?
  end

  def my_page_links
    return unless signed_in?

    class_name = (current_path[0..6] == '/users/' ? 'nav-link active' : 'nav-link')
    link_to "My Events (#{current_user.name})", user_path(current_user_id), class: class_name
  end

  def sign_out_links
    if signed_in?
      link_to 'Sign Out', session_path(current_user_id), method: :delete, class: 'nav-link'
    else
      link_to 'Sign In', new_session_path, class: class_namer('/sessions/new')
    end
  end

  def create_event_links
    link_to 'Create New Event', new_event_path, class: class_namer('/events/new') if signed_in?
  end

  def events_calendar_links
    class_name = current_path == '/' || current_path == '/events' ? 'nav-link active' : 'nav-link'
    link_to 'Events Calendar', events_path, class: class_name if signed_in?
  end

  def sign_up_links
    link_to 'Sign Up', new_user_path, class: class_namer('/users/new')
  end

  private

  def class_namer(path)
    current_path == path ? 'nav-link active' : 'nav-link'
  end

  def current_path
    request.env['PATH_INFO']
  end
end
