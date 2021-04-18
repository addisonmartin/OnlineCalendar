# == Schema Information
#
# Table name: calendars
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  slug       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_calendars_on_slug     (slug) UNIQUE
#  index_calendars_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_d574754a30  (user_id => users.id)
#
class Calendar < ApplicationRecord
  belongs_to :user, inverse_of: :calendars
  has_many :events, inverse_of: :calendar

  has_rich_text :description

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  include FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
