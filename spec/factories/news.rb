FactoryBot.define do
  factory :news do
    name { Faker::Lorem.word }
    status { Faker::Number.between(0, 2) }
  end
end