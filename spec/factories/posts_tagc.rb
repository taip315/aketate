FactoryBot.define do
  factory :posts_tag do
    wine_name             {Faker::Beer.brand}
    vintage               {Faker::Number.number(digits: 4)}
    content               {Faker::String.random}
    price                 {Faker::Number.number(digits: 4)}
    open_date             {Faker::Date.in_date_period}
    wine_genre_id         {Faker::Number.between(from:1,to:5)}
    name                  {Faker::String.random}
    sold_out              {Faker::Number.between(from:0,to:1)}

  end
end