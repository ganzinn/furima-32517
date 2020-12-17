class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :shipping_from_area
  belongs_to_active_hash :shipping_duration

  belongs_to :owner, class_name: 'User'
  has_one :order

  has_one_attached :image

  # 以下バリデーション ※「with_options」は使用しない

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true,  length: { maximum: 1000 }
  validates :category_id, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 10,
    message: 'Select'
  }
  validates :condition_id, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 6,
    message: 'Select'
  }
  validates :shipping_payer_id,
    numericality: {
      greater_than_or_equal_to: 1, less_than_or_equal_to: 2,
      message: 'Select'
    }
  validates :shipping_from_area_id,
    numericality: {
      greater_than_or_equal_to: 1, less_than_or_equal_to: 47,
      message: 'Select'
    }
  validates :shipping_duration_id,
    numericality: {
      greater_than_or_equal_to: 1, less_than_or_equal_to: 3,
      message: 'Select'
    }
  validates :price,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
      message: 'Out of setting range'
    }
end
