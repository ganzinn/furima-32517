FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = 'abc123' # Fakerを用いた場合、数回に一回エラーとなるため直接指定
    password { password }
    password_confirmation { password }
    family_name_kanji { Faker::Name.last_name }
    first_name_kanji { Faker::Name.first_name }
    family_name_kana { 'ミョウジ' } # Fakerには全角カナ指定はないため直接指定
    first_name_kana { 'ナマエ' } # Fakerには全角カナ指定はないため直接指定
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
