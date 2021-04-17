class CalendarDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def display_as_day_number(date)
    date.strftime("%-d")
  end

  def get_holidays(date)
    holidays = []

    Holidays.on(date, :us, :ca, :informal, :observed).each do |holiday|
      holidays << holiday[:name]
    end

    holidays.uniq
  end

end
