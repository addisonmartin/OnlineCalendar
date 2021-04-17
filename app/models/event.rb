class Event < ApplicationRecord
  belongs_to :calendar, inverse_of: :events

  has_rich_text :description
end
