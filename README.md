# テーブル設計

## users テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| family_name_kanji  | string     | null: false                    |
| first_name_kanji   | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| date_of_birth      | date       | null: false                    |

### Association
- has_many :items
- has_many :orders


## items テーブル
| Column                | Type       | Options                           |
| --------------------- | ---------- | --------------------------------- |
| owner                 | references | foreign_key: { to_table: :users } |
| name                  | string     | null: false                       |
| description           | text       | null: false                       |
| category_id           | integer    | null: false                       |
| condition_id          | integer    | null: false                       |
| shipping_payer_id     | integer    | null: false                       |
| shipping_from_area_id | integer    | null: false                       |
| shipping_duration_id  | integer    | null: false                       |
| price                 | integer    | null: false                       |

### Association
- belongs_to :owner, class_name: 'User'
- has_one :order


## orders テーブル
| Column     | Type       | Options                           |
| ---------- | ---------- | --------------------------------- |
| item       | references | foreign_key: true                 |
| buyer      | references | foreign_key: { to_table: :users } |

### Association
- belongs_to :item
- belongs_to :buyer, class_name: 'User'
- has_one :destination


## destinations テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| order      | references | foreign_key: true              |
| zip_code   | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| telephone  | string     | null: false                    |

### Association
- belongs_to :order
