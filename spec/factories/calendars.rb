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
FactoryBot.define do
  factory :calendar do
    user { user }
    name { "MyText" }
    description { "Description" }
  end
end
