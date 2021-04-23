FactoryBot.define do
  factory :post do
    wine_name             {Faker::Beer.brand}
    vintage               {Faker::Number.number(digits: 4)}
    content               {Faker::Lorem.sentence}
    price                 {Faker::Number.number(digits: 4)}
    open_date             {Faker::Date.in_date_period}
    wine_genre_id         {Faker::Number.between(from:1,to:5)}
    sold_out              {Faker::Number.between(from:0,to:1)}
    association :shop
  end
end