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

  COLOR_OPTIONS = ["None", "Red", "Orange", "Green", "Cyan", "Blue"].freeze

  validates :name, :color, :starts_at, :ends_at, presence: true
  validates :color, inclusion: { in: COLOR_OPTIONS, message: "%{value} is not a valid color" }
  validate :ends_at_after_starts_at

  def ends_at_after_starts_at
    if ends_at < starts_at
      errors.add(:starts_at, "must be before end time")
      errors.add(:ends_at, "must be after start time")
    end
  end

  scope :completed, -> { where.not(completed_at: nil) }
  scope :not_completed, -> { where(completed_at: nil) }
end
