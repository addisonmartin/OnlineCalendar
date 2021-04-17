module CalendarsHelper
  def start_date
    params.fetch(:start_date, Date.today).to_date
  end

  def month(date)
    date.strftime("%B")
  end
end
