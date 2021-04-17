# == Schema Information
#
# Table name: calendars
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
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
end
