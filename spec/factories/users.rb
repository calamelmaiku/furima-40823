FactoryBot.define do
  factory :user do
    transient do
      namae { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {namae.last.kanji}
    first_name            {namae.first.kanji}
    last_name_kana        {namae.last.katakana}
    first_name_kana       {namae.first.katakana}
    birth                 {Faker::Date.birthday}
  end
end