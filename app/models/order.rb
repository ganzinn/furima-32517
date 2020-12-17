class Order < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User'
  has_one :destination

end
