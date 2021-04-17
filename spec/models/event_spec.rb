# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
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
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
