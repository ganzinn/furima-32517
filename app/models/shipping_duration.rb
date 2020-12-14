class ShippingDuration < ActiveHash::Base
  self.data = [
    { id: 0, value: '---' },
    { id: 1, value: '1~2日で発送' },
    { id: 2, value: '2~3日で発送' },
    { id: 3, value: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
