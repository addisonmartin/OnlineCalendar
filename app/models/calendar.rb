class Calendar < ApplicationRecord
  belongs_to :user, inverse_of: :calendars
  has_many :events, inverse_of: :calendar

  has_rich_text :description
end
