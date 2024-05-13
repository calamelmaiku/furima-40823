FactoryBot.define do
  factory :item do
    name           {Faker::Alphanumeric.alphanumeric(number: 10)}
    comment        {Faker::Alphanumeric.alphanumeric(number: 10)}
    category_id    {Faker::Number.within(range: 2..11)}
    condition_id   {Faker::Number.within(range: 2..3)}
    delivery_id    {Faker::Number.within(range: 2..3)}
    prefecture_id  {Faker::Number.within(range: 1..47)}
    span_id        {Faker::Number.within(range: 2..4)}
    price          {Faker::Number.within(range: 300..9999999)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
