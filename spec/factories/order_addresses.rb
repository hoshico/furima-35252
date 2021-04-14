FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '大阪府' }
    house_number { '1-1' }
    building_name { '大阪ハイツ' }
    phone_number { '09012345678' }
  end
end