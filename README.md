# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false, unique: true |
| password        | string  | null: false |
| last-name       | string  | null: false |
| first-name      | string  | null: false |
| last-name-kana  | string  | null: false |
| first-name-kana | string  | null: false |
| year            | integer | null: false |
| month           | integer | null: false |
| date            | integer | null: false |


### Association

- has_many :item_users
- has_many :items, through: :item_users
- has_many :comments
- has_many :purchases

## items テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| image     | text    | null: false |
| name      | string  | null: false |
| text      | text    | null: false |
| category  | string  | null: false |
| condition | string  | null: false |
| charge    | string  | null: false |
| region    | string  | null: false |
| span      | string  | null: false |
| price     | integer | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :comments
- has_one :purchases

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