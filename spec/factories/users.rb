require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Alphanumeric.alphanumeric(10..128) }
    password_confirmation { password }
  end
end
