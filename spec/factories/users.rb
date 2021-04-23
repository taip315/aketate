FactoryBot.define do
  factory :user do
      email               {Faker::Internet.email}
      password            {Faker::Internet.password(min_length:30)}
      nickname            {Gimei.first.hiragana}
      last_name           {Gimei.last.kanji}
      first_name          {Gimei.first.kanji}
      last_kana           {Gimei.last.katakana}
      first_kana          {Gimei.first.katakana}
      birthday            {Faker::Date.between(from: '1930-1-1', to: '2020-12-31')}
      gender_id           {Faker::Number.between(from:1,to:3)}
      phone_number        {"090-1212-1212"}
  end
end

