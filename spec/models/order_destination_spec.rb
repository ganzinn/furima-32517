require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, item_id: @item.id, buyer_id: @user.id)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@order_destination).to be_valid
    end
    it 'address2が空の場合、登録できること' do
      @order_destination.address2 = nil
      expect(@order_destination).to be_valid
    end
    it 'card_tokenが空の場合、登録できないこと' do
      @order_destination.card_token = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Card token can't be blank")
    end
    it 'zip_codeが空の場合、登録できないこと' do
      @order_destination.zip_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeが「3桁半角数字、ハイフン（-）、4桁半角数字」でない場合、登録できないこと' do
      @order_destination.zip_code = "12-45678"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Zip code Input correctly")
    end
    it 'prefecture_idが空の場合、登録できないこと' do
      @order_destination.prefecture_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture Select")
    end
    it 'prefecture_idが「0」（未選択）の場合、登録できないこと' do
      @order_destination.prefecture_id = 0
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture Select")
    end
    it 'prefecture_idが「48」（選択肢外の値）の場合、登録できないこと' do
      @order_destination.prefecture_id = 48
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture Select")
    end
    it 'cityが空の場合、登録できないこと' do
      @order_destination.city = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'address1が空の場合、登録できないこと' do
      @order_destination.address1 = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address1 can't be blank")
    end
    it 'telephoneが空の場合、登録できないこと' do
      @order_destination.telephone = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'telephoneが半角数字以外の場合、登録できないこと' do
      @order_destination.telephone = "０９０１２３４５６７８"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Telephone Input only number")
    end
    it 'telephoneが12桁以上の場合、登録できないこと' do
      @order_destination.telephone = "123456789012"
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Telephone Input only number")
    end
    it 'buyer_idが空の場合、登録できないこと' do
      @order_destination.buyer_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Buyer can't be blank")
    end
    it 'item_idが空の場合、登録できないこと' do
      @order_destination.item_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Item can't be blank")
    end
  end
end
