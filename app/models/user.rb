class User < ApplicationRecord
  # Include devise (user authentication) modules.
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
end
