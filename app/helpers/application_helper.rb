module ApplicationHelper
  def welcome_links
    ('Welcome ' + current_user.name) if signed_in?
  end

  def my_page_links
    return unless signed_in?

    link_to "My Events (#{current_user.name})", user_path(current_user_id), class: 'nav-link'
  end

  def sign_out_links
    if signed_in?
      link_to 'Sign Out', session_path(current_user_id), method: :delete, class: 'nav-link'
    else
      link_to 'Sign In', new_session_path, class: 'nav-link'
    end
  end

  def create_event_link
    link_to 'Create New Event', new_event_path, class: 'nav-link' if signed_in?
  end

  def events_calendar_link
    link_to 'Events Calendar', events_path, class: 'nav-link' if signed_in?
  end
end
