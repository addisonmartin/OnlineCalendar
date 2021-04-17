FactoryBot.define do
  factory :event do
    calendar { calendar }
    name { "MyEvent" }
    description { "Description" }
    duration { Date.now ... Date.now }
  end
end
