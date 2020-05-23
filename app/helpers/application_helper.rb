module ApplicationHelper
  def welcome_links
    ('Welcome ' + current_user.name) if signed_in?
  end

  def my_page_links
    return unless signed_in?

    @class_name = if %r{^/users/\d+}.match(current_path)
                    'nav-link text-success'
                  else
                    'nav-link'
                  end
    render 'layouts/my_events_links'
  end

  def sign_out_links
    if signed_in?
      render 'sessions/sign_in'
    else
      render 'sessions/sign_out'
    end
  end

  def create_event_links
    render 'layouts/create_new_event' if signed_in?
  end

  def events_calendar_links
    @class_name = current_path == '/' || current_path == '/events' ? 'nav-link text-success ' : 'nav-link'
    render 'layouts/events_calendar_links' if signed_in?
  end

  private

  def class_namer(path, color)
    current_path == path ? "nav-link text-#{color}" : 'nav-link'
  end

  def current_path
    request.env['PATH_INFO']
  end
end
