# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  color        :text             not null
#  completable  :boolean          default(FALSE)
#  completed_at :datetime
#  ends_at      :datetime         not null
#  name         :text             not null
#  starts_at    :datetime         not null
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  calendar_id  :bigint           not null
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

  has_paper_trail

  COLOR_OPTIONS = ['None', 'Red', 'Orange', 'Green', 'Cyan', 'Blue'].freeze

  validates :name, :color, :starts_at, :ends_at, presence: true
  validates :color, inclusion: { in: COLOR_OPTIONS, message: '%{value} is not a valid color' }
  validates_datetime :starts_at, :ends_at
  validates_datetime :ends_at, after: :starts_at

  scope :completed, -> { where.not(completed_at: nil) }
  scope :not_completed, -> { where(completed_at: nil) }

  # Usage: Event.for(params) from within the controller.
  def self.for(params)

    event_type = params.delete(:type)
    case event_type
    when 'Event'
      Event
    when 'RoutineEvent'
      RoutineEvent
    else
      raise('Unknown type!')
    end.new(params)

  end
end
