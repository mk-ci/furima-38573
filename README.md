# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| password               | string | null: false               |
| Password_confirmation  | string | null: false               |
| first_name             | string | null: false               |
| last_name              | string | null: false               |
| first_kana             | string | null: false               |
| last_kana              | string | null: false               |
| year_of_birth          | string | null: false               |
| birth_month            | string | null: false               |
| day_of_birth           | string | null: false               |


### Association

- has_many :item
- has_many :order
- has_many :comment


## items テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| image             | string     | null: false                    |
| item_name         | string     | null: false                    |
| explanation       | string     | null: false                    |
| category          | string     | null: false                    |
| condition         | string     | null: false                    |
| shipping_charges  | string     | null: false                    |
| region_of_origin  | string     | null: false                    |
| days_to_ship      | string     | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_many :comment
- has_one :order
- belongs_to :user

## orders テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| card_number      | string     | null: false                    |
| expiration_date  | string     | null: false                    |
| security_code    | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |
| item             | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user

## comments テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| comment          | text       | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
