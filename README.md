# テーブル設計

## users テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| email      | string     | null: false                    |
| password   | string     | null: false                    |
| nickname   | string     | null: false                    |

### Association
- has_many :items
- has_many :orders
- has_one :profile


## items テーブル
| Column             | Type       | Options                           |
| ------------------ | ---------- | --------------------------------- |
| owner              | references | foreign_key: { to_table: :users } |
| name               | string     | null: false                       |
| description        | text       | null: false                       |
| category           | integer    | null: false                       |
| condition          | integer    | null: false                       |
| shipping_payer     | integer    | null: false                       |
| shipping_from_area | integer    | null: false                       |
| shipping_duration  | integer    | null: false                       |
| price              | integer    | null: false                       |
| fee                | integer    | null: false                       | ※
| profit             | integer    | null: false                       | ※
※ 手数料変更となっても出品時に確定した手数料・利益を適用できるようにするためitemsテーブルに保持。

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
| address2   | string     | null: false                    |
| telephone  | string     | null: false                    |

### Association
- belongs_to :order


## profiles テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | foreign_key: true              |
| family_name_kanji | string     | null: false                    |
| first_name_kanji  | string     | null: false                    |
| family_name_kana  | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| date_of_birth     | date       | null: false                    |

### Association
- belongs_to :user
