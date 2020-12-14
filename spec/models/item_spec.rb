require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  it '全ての項目が存在すれば登録できること' do
    expect(@item).to be_valid
  end
  it 'imageが空の場合、保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'nameが空の場合、登録できないこと' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it 'nameの文字数が40文字より多い場合、登録できないこと' do
    str = ''
    41.times { str += 'a' }
    @item.name = str
    @item.valid?
    expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
  end
  it 'descriptionが空の場合、登録できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'descriptionの文字数が1000文字より多い場合、登録できないこと' do
    str = ''
    1001.times { str += 'a' }
    @item.description = str
    @item.valid?
    expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
  end
  it 'category_idが空の場合、登録できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end
  it 'category_idが「0」（未選択）の場合、登録できないこと' do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end
  it 'category_idが「11」（選択肢外の値）の場合、登録できないこと' do
    @item.category_id = 11
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end
  it 'condition_idが空の場合、登録できないこと' do
    @item.condition_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition Select")
  end
  it 'condition_idが「0」（未選択）の場合、登録できないこと' do
    @item.condition_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition Select")
  end
  it 'condition_idが「7」（選択肢外の値）の場合、登録できないこと' do
    @item.condition_id = 7
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition Select")
  end
  it 'shipping_payer_idが空の場合、登録できないこと' do
    @item.shipping_payer_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping payer Select")
  end
  it 'shipping_payer_idが「0」（未選択）の場合、登録できないこと' do
    @item.shipping_payer_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping payer Select")
  end
  it 'shipping_payer_idが「3」（選択肢外の値）の場合、登録できないこと' do
    @item.shipping_payer_id = 3
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping payer Select")
  end
  it 'shipping_from_area_idが空の場合、登録できないこと' do
    @item.shipping_from_area_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping from area Select")
  end
  it 'shipping_from_area_idが「0」（未選択）の場合、登録できないこと' do
    @item.shipping_from_area_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping from area Select")
  end
  it 'shipping_from_area_idが「48」（選択肢外の値）の場合、登録できないこと' do
    @item.shipping_from_area_id = 48
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping from area Select")
  end
  it 'shipping_duration_idが空の場合、登録できないこと' do
    @item.shipping_duration_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping duration Select")
  end
  it 'shipping_duration_idが「0」（未選択）の場合、登録できないこと' do
    @item.shipping_duration_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping duration Select")
  end
  it 'shipping_duration_idが「4」（選択肢外の値）の場合、登録できないこと' do
    @item.shipping_duration_id = 4
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping duration Select")
  end
  it 'priceが空の場合、登録できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが300未満の場合、登録できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
  it 'priceが9,999,999より大きい場合、登録できないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
  it 'priceが半角数字でない場合、登録できないこと' do
    @item.price = '１０００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end
end
