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

calendar = Calendar.create(name: 'My Calendar', description: Faker::Lorem.unique.sentence, user_id: user.id)
calendar.save!

(-120..120).each do |day_offset|
  rand(12).times do
    event = Event.create(name: Faker::Lorem.unique.sentence, calendar: calendar, description: Faker::Lorem.paragraph(sentence_count: rand(4)),
                         color: Event::COLOR_OPTIONS[rand(Event::COLOR_OPTIONS.length)],
                         starts_at: Faker::Time.between_dates(from: DateTime.now - day_offset - 1, to: DateTime.now - day_offset, period: :morning, format: :long),
                         ends_at: Faker::Time.between_dates(from: DateTime.now - day_offset - 1, to: DateTime.now - day_offset, period: :evening, format: :long))

    if rand(2).zero?
      event.completable = true
      event.completed_at = rand(2).zero? ? nil : Faker::Time.backward(days: 10)
    end

    event.save
  end
end
