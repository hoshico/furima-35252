FactoryBot.define do
  factory :item do
    name                   {"木彫りの熊"}
    info                   {"大きめ"}
    category_id            {"1"}
    status_id              {"1"}
    shipping_fee_status_id {"2"}
    prefecture_id          {"1"}
    scheduled_delivery_id  {"1"}
    price                  {"500"} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
