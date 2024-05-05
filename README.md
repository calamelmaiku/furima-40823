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
- has_many :comments
- has_many :purchases

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| text         | text    | null: false |
| category_id  | integer | null: false |
| condition_id | integer | null: false |
| delivery_id  | integer | null: false |
| region_id    | integer | null: false |
| span_id      | integer | null: false |
| price        | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## item-users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## receivers テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| card-number   | integer    | null: false, unique: true |
| expiry        | integer    | null: false |
| security-code | integer    | null: false |
| postcode      | integer    | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| street        | string     | null: false |
| build         | string     |             |
| telephone     | integer    | null: false |
| item_id       | references | null: false |
| user_id       | references | null: false |



### Association

- belongs_to :item