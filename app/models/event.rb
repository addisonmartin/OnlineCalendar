# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  color       :text
#  ends_at     :datetime
#  name        :text
#  starts_at   :datetime
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
class Event < ApplicationRecord
  belongs_to :calendar, inverse_of: :events

  has_rich_text :description

  COLOR_OPTIONS = ["None", "Red", "Orange", "Green", "Cyan", "Blue", "Gray"].freeze
end
