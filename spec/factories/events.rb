# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  duration    :daterange
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  calendar_id :bigint           not null
#
# Indexes
#
#  index_events_on_calendar_id  (calendar_id)
#
# Foreign Keys
#
#  fk_rails_f8565e0d58  (calendar_id => calendars.id)
#
FactoryBot.define do
  factory :event do
    calendar { calendar }
    name { "MyEvent" }
    description { "Description" }
    duration { Date.now ... Date.now }
  end
end
