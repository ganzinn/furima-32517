FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order_destination do
    card_token { 'tok_abcdefghijk00000000000000000' }
    item_id { '1' }
    buyer_id { '2' }
    zip_code { Faker::Address.zip_code }
    prefecture_id { Faker::Number.between(from: 1, to: 47).to_s }
    city { Faker::Address.city }
    address1 { Faker::Address.street_name }
    address2 { Faker::Address.street_address }
    telephone { Faker::Number.number(digits: 11).to_s }
  end
end
