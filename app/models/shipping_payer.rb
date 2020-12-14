class ShippingPayer < ActiveHash::Base
  self.data = [
    { id: 0, value: '---' },
    { id: 1, value: '着払い(購入者負担)' },
    { id: 2, value: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
