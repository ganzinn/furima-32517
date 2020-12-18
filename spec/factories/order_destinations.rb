FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order_destination do
    card_token { 'tok_abcdefghijk00000000000000000' }
    # item_id {}      # Formオブジェクトのためアソシエーションによる自動生成はできない。テスト実施時に代入。
    # buyer_id {}     # 上記同様
    zip_code { Faker::Address.zip_code }
    prefecture_id { Faker::Number.between(from: 1, to: 47).to_s }
    city { Faker::Address.city }
    address1 { Faker::Address.street_name }
    address2 { Faker::Address.street_address }
    telephone { Faker::Number.number(digits: 11).to_s }
  end
end
