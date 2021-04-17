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

date = DateTime.now



#update factories too!