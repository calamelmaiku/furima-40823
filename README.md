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
- has_one  :address
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
- has_one    :purchase
- belongs_to :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postcode      | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| street        | string     | null: false |
| build         | string     |             |
| telephone     | string     | null: false |

### Association

- has_many   :items
- belongs_to :user

## purchases テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | references | null: false |
| item_id | references | null: false |

### Association

- belongs_to :user
- belongs_to :item