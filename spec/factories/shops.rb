FactoryBot.define do
  factory :shop do
    email { Faker::Internet.email }
    password            { Faker::Internet.password(min_length: 30) }
    shop_name           { '焼肉キング' }
    administrator       { Gimei.last.kanji }
    postal              { '123-1234' }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    address             { '中央1-1-1-201' }
    building            { '山田ビル' }
    nearest_station     { '新宿' }
    genre_id            { Faker::Number.between(from: 2, to: 10) }
    phone_number        { '090-1212-1212' }
  end
end
