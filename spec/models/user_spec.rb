require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空の場合、登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空の場合、登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていない場合、登録できないこと' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合、登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが6文字以上かつ半角英数字混在であれば登録できること' do
      password = 'aaa111'
      @user.password = password
      @user.password_confirmation = password
      expect(@user).to be_valid
    end
    it 'passwordが空の場合、登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下の場合、登録できないこと' do
      password = 'aaa11'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英字のみの場合、登録できないこと' do
      password = 'aaaaaa'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが半角数字のみの場合、登録できないこと' do
      password = '111111'
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordとpassword_confirmationが不一致の場合、登録できないこと' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa1112'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_name_kanjiが全角文字であれば登録できること' do
      @user.family_name_kanji = '山田'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'family_name_kanjiが空の場合、登録できないこと' do
      @user.family_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    it 'family_name_kanjiが半角文字の場合、登録できないこと' do
      @user.family_name_kanji = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kanji Full-width characters')
    end
    it 'first_name_kanjiが全角文字であれば登録できること' do
      @user.first_name_kanji = '太郎'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'first_name_kanjiがの場合、登録できないこと' do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'first_name_kanjiが半角文字の場合、登録できないこと' do
      @user.first_name_kanji = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji Full-width characters')
    end
    it 'family_name_kanaが全角カタカナであれば登録できること' do
      @user.family_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'family_name_kanaが空の場合、登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'family_name_kanaが全角ひらがなの場合、登録できないこと' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end
    it 'family_name_kanaが半角カタカナの場合、登録できないこと' do
      @user.family_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end
    it 'first_name_kanaが全角カタカナであれば登録できること' do
      @user.first_name_kana = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'first_name_kanaが空の場合、登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角ひらがなの場合、登録できないこと' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaが半角カタカナの場合、登録できないこと' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'date_of_birthが空の場合、登録できないこと' do
      @user.date_of_birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
