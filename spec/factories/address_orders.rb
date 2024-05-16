FactoryBot.define do
  factory :address_order do
    postcode       {'000-0000'}
    prefecture_id  {Faker::Number.within(range: 1..47)}
    city           {Faker::Address.city}
    street         {Faker::Address.street_name}
    build          {Faker::Address.street_address}
    telephone      {1111111111}
  end
end