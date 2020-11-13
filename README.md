
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| nickname             | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth_date           | date   | null: false |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column    | Type       | Options                        
| ---------------------- | ---------- |------------------- |
| name                   | string     | null: false        |
| info                   | text       | null: false        |
| price                  | integer    | null: false        |
| user                   | references | foreign_key: true  |
| category_id            | integer    | null: false        |
| sales_status_id        | integer    | null: false        |
| shipping_fee_status_id | integer    | null: false        |
| prefecture_id          | integer    | null: false        |
| scheduled_delivery_id  | integer    | null: false        |


### Association

- has_one : order
- belongs_to :user


## orders テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one : address


## addresses テーブル

| Column           | Type        | Options           |
| ---------------- | ----------- | ----------------- |
| postal_code      | string      | null: false       |
| city             | string      | null: false       |
| house_number     | string      | null: false,      |
| building_name    | string      |                   |
| phone_number     | string      | null: false       |
| prefecture_id    | integer     | null: false       |
| order            | references  | foreign_key: true |


### Association

- belongs_to :order