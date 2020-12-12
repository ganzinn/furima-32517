FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    # password = Faker::Internet.password(min_length: 6)
    password = 'abc123'
    password {password}
    password_confirmation {password}
    family_name_kanji{Faker::Name.last_name}
    first_name_kanji{Faker::Name.first_name}
    family_name_kana{"ミョウジ"}
    first_name_kana{"ナマエ"}
    date_of_birth{Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end