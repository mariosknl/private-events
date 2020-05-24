module EventsHelper
  def delete_event_button
    render 'events/delete_event' if current_user.id == @event.creator.id
  end

  def delete_upcoming_event_button(event)
    return unless event.date > Time.now

    class_name = 'btn btn-danger btn-sm px-2'
    link_to 'Cancel', event_path(event.id), method: :delete,
                                            class: class_name, data: { confirm: 'You are going to delete this event?' }
  end
end
