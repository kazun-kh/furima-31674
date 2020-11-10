
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| email                | string | null: false |
| password             | string | null: false |
| password_confirmation| string | null: false |
| nick_name            | string | null: false |
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
| ------------------- | ---------- |------------------------------- |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | foreign_key: true              |
| category            | integer    | null: false                    |
| sales_status        | integer    | null: false                    |
| shipping_fee_status | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| scheduled_delivery  | integer    | null: false                    |


### Association

- has_one : order
- belongs_to :user


## orders テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |
| date     | datetime   | null: false,      |


### Association

- belongs_to :user
- belongs_to :item
- has_one : address


## addresses テーブル

| Column        | Type        | Options           |
| ------------- | ----------- | ----------------- |
| postal_code   | string      | foreign_key: true |
| city          | string      | foreign_key: true |
| house_number  | string      | null: false,      |
| building_name | string      | null: false,      |
| phone_number  | integer     | null: false,      |
| prefecture    | integer     | null: false,      |
| order         | references  | foreign_key: true |


### Association

- belongs_to :order