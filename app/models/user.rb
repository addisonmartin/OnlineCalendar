class User < ApplicationRecord
  has_many :calendars, inverse_of: :user
  has_many :events, through: :calendars

  # Include devise (user authentication) modules.
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
end
