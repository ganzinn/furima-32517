class User < ApplicationRecord
  has_many :items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_MESSAGE = 'Include both letters and numbers'.freeze

  # 全角（漢字・ひらがな・カタカナ）
  NAME_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  NAME_KANJI_MESSAGE = 'Full-width characters'.freeze

  # 全角（カタカナ）
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  NAME_KANA_MESSAGE = 'Full-width katakana characters'.freeze

  # 半角英数字混合チェック
  with_options format: { with: PASSWORD_REGEX, message: PASSWORD_MESSAGE } do
    validates :password
  end

  # 必須入力チェック
  with_options presence: true do
    validates :nickname

    # 全角（漢字・ひらがな・カタカナ）チェック
    with_options format: { with: NAME_KANJI_REGEX, message: NAME_KANJI_MESSAGE } do
      validates :family_name_kanji
      validates :first_name_kanji
    end

    # 全角（カタカナ）チェック
    with_options format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE } do
      validates :family_name_kana
      validates :first_name_kana
    end

    validates :date_of_birth
  end
end
