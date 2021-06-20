FactoryBot.define do
  factory :order_address do
    transient do
      address { Gimei.address}
    end

    token {"tok_abcdefghijk00000000000000000"}
    user_id       { FactoryBot.create(:user).id }
    item_id       { FactoryBot.create(:item).id }
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    post_number   {"123-4567"}
    phone_number  {Faker::Number.number(digits: 11)}
    city          {address.city}
    house_number  {address.town}
  end

end