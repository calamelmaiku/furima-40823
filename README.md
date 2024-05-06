# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth              | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| comment       | text       | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| delivery_id   | integer    | null: false |
| prefecture_id | integer    | null: false |
| span_id       | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postcode      | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| street        | string     | null: false |
| build         | string     |             |
| telephone     | string     | null: false |
| order         | references | null: false, foreign_key: true |


### Association

- has_many :orders

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
