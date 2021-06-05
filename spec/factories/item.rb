FactoryBot.define do
  factory :item do
    title         {Faker::Lorem.sentence}
    description   {Faker::Lorem.sentence}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    shipping_id   {Faker::Number.between(from: 2, to: 3)}
    status_id     {Faker::Number.between(from: 2, to: 7)}
    category_id   {Faker::Number.between(from: 2, to: 11)}
    lead_time_id  {Faker::Number.between(from: 2, to: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    user_id       { FactoryBot.create(:user).id }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test1.jpg'), filename: 'test1.jpg', content_type: 'image/jpg')
    end
  end
end