class EventDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def duration
    h.distance_of_time_in_words(starts_at, ends_at)
  end

  def starts_at_time
    starts_at.strftime("%l:%M %P")
  end

  def background_color
    COLOR_TO_BOOTSTRAP_NAME[color]
  end

  private

  COLOR_TO_BOOTSTRAP_NAME = {
    "None" => 'bg-white',
    "Red" => 'bg-danger',
    "Orange" => 'bg-warning',
    "Green" => 'bg-success',
    "Cyan" => 'bg-warning',
    "Blue" => 'bg-primary',
    "Gray" => 'bg-secondary'
  }.freeze
end
