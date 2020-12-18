class OrderDestination
  include ActiveModel::Model
  attr_accessor :card_token,
                :item_id,
                :buyer_id,
                :zip_code,
                :prefecture_id,
                :city,
                :address1,
                :address2,
                :telephone

  # バリデーション --------------------------------
  # 共通チェック
  # 必須チェック
  with_options presence: true do
    validates :card_token
    validates :zip_code
    validates :prefecture_id
    validates :city
    validates :address1
    validates :telephone
    validates :item_id  # nilチェックのみ（参照先テーブルのID存在チェックはできない）
    validates :buyer_id # nilチェックのみ（参照先テーブルのID存在チェックはできない）
  end

  # 個別チェック
  ZIP_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  ZIP_CODE_MESSAGE = 'Input correctly'.freeze
  validates :zip_code, format: { with: ZIP_CODE_REGEX, message: ZIP_CODE_MESSAGE }

  TELEPHONE_REGEX = /\A\d{,11}\z/.freeze
  TELEPHONE_MESSAGE = 'Input only number'.freeze
  validates :telephone, format: { with: TELEPHONE_REGEX, message: TELEPHONE_MESSAGE }

  validates :prefecture_id,
    numericality: {
      greater_than_or_equal_to: 1, less_than_or_equal_to: 47,
      message: 'Select'
    }
  # ----------------------------------------------

  def save
    order = Order.create(item_id: item_id, buyer_id: buyer_id)
    Destination.create(
      order_id: order.id,
      zip_code: zip_code,
      prefecture_id: prefecture_id,
      city: city,
      address1: address1,
      address2: address2,
      telephone: telephone
    )
  end
end
