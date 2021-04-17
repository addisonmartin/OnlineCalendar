module CalendarsHelper
  def get_holidays(date)
    holidays = []

    Holidays.on(date, :us, :ca, :informal, :observed).each do |holiday|
      holidays << holiday[:name]
    end

    holidays.uniq
  end
end
