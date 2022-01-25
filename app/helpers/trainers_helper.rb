module TrainersHelper
  def set_link_state(link:, current_user:, user:, text: nil, view_context: nil)
    if current_user&.id == user.id
      link
    else
      place_holder = ActiveSupport::SafeBuffer.new("<a href=\"#\">#{text}</a>")
      view_context.content_tag :span, place_holder, class: 'isDisabled'
    end
  end
end
