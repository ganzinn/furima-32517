class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true

  # 半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_MESSAGE = 'Include both letters and numbers'.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: PASSWORD_MESSAGE }

  validates :nickname, presence: true

  # 全角（漢字・ひらがな・カタカナ）
  NAME_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  NAME_KANJI_MESSAGE = 'Full-width characters'.freeze
  validates :family_name_kanji, presence: true, format: { with: NAME_KANJI_REGEX, message: NAME_KANJI_MESSAGE }
  validates :first_name_kanji, presence: true, format: { with: NAME_KANJI_REGEX, message: NAME_KANJI_MESSAGE }

  # 全角（カタカナ）
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  NAME_KANA_MESSAGE = 'Full-width katakana characters'.freeze
  validates :family_name_kana, presence: true, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX, message: NAME_KANA_MESSAGE }

  validates :date_of_birth, presence: true
end
