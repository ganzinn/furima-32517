FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { '説明' }
    category_id { 1 }
    condition_id { 1 }
    shipping_payer_id { 1 }
    shipping_from_area_id { 1 }
    shipping_duration_id { 1 }
    price { 1000 }

    association :owner, factory: :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
