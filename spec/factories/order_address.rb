FactoryBot.define do
  factory :order_address do
    transient do
      address { Gimei.address}
    end

    token {"tok_abcdefghijk00000000000000000"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    post_number   {"123-4567"}
    phone_number  {Faker::Number.number(digits: 11)}
    city          {address.city}
    house_number  {address.town}
    building_name {Faker::Lorem.sentence}
  end

end