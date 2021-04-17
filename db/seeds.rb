# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create(email: 'admin@email.com', password: 'passwordpassword', password_confirmation: 'passwordpassword')
user.skip_confirmation!
user.save!

calendar = Calendar.create(name: 'My Calendar', user_id: user.id)
calendar.save!

(-120..120).each_with_index do |day_offset|
  rand(12).times do
    event = Event.create(name: Faker::Lorem.unique.sentence, calendar: calendar,
                         starts_at: Faker::Time.between_dates(from: DateTime.now - day_offset - 1, to: DateTime.now - day_offset, period: :morning, format: :long),
                         ends_at: Faker::Time.between_dates(from: DateTime.now - day_offset - 1, to: DateTime.now - day_offset, period: :evening, format: :long))
    event.save!
  end
end

#update factories too!