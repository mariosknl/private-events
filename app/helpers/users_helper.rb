module UsersHelper
  def upcoming?(event)
    event.date > Time.now
  end

  def badge_selector(event)
    if upcoming?(event)
      render 'upcoming_event_badge'
    else
      render 'prev_event_badge'
    end
  end
end
