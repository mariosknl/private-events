module ApplicationHelper
  def welcome_links
    ('Welcome ' + current_user.name) if signed_in?
  end

  def my_page_links
    return unless signed_in?

    class_name = if %r{^/users/\d+}.match(current_path)
                   'nav-link text-success'
                 else
                   'nav-link'
                 end
    link_to "My Events (#{current_user.name})", user_path(current_user_id), class: class_name
  end

  def sign_out_links
    if signed_in?
      link_to 'Sign Out', session_path(current_user_id), method: :delete, class: 'nav-link'
    else
      link_to 'Sign In', new_session_path, class: class_namer('/sessions/new', 'success')
    end
  end

  def create_event_links
    link_to 'Create New Event', new_event_path, class: class_namer('/events/new', 'warning') if signed_in?
  end

  def events_calendar_links
    class_name = current_path == '/' || current_path == '/events' ? 'nav-link text-success ' : 'nav-link'
    link_to 'Events Calendar', events_path, class: class_name if signed_in?
  end

  def sign_up_links
    link_to 'Sign Up', new_user_path, class: class_namer('/users/new', 'warning')
  end

  private

  def class_namer(path, color)
    current_path == path ? "nav-link text-#{color}" : 'nav-link'
  end

  def current_path
    request.env['PATH_INFO']
  end
end
