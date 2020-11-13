FactoryBot.define do
  factory :item do
    name                   {"ギター"}
    info                   {Faker::Lorem.sentence}
    price                  {9999}
    category_id            {3}
    sales_status_id        {2}
    shipping_fee_status_id {2}         
    prefecture_id          {3}
    scheduled_delivery_id  {3}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Guitar.jpg'), filename: 'Guitar.jpg')
    end
  end
end