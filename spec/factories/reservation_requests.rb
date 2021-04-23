FactoryBot.define do
  factory :reservation_request do
    start_time            {Faker::Time.forward(days: 30)}
    number_of_people      {Faker::Number.between(from:0,to:1)}
    association :user
    association :shop
  
  end
end