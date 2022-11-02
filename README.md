# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_kana          | string | null: false               |
| last_kana           | string | null: false               |
| birthday            | date   | null: false               |


### Association

- has_many :orders
- has_many :comments


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| explanation       | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false                    |
| shipping_charges  | integer    | null: false                    |
| prefectures       | integer    | null: false                    |
| days_to_ship      | integer    | null: false                    |
| price             | string     | null: false                    |

### Association

- has_many :comments
- has_many :orders

## orders テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| comment          | text       | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
