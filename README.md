# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type          | Options     |
| ------------------- | ------------- | ----------- |
| name                | string        | null: false |
| info                | text          | null: false |
| category            | integer       | null: false |
| status              | integer       | null: false |
| shipping_fee_status | integer       | null: false |
| prefecture          | integer       | null: false |
| scheduled_delivery  | integer       | null: false |
| price               | string        | null: false |
| user                | references    |             |


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| user          | references    |             |
| item          | references    |             |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| postal_code   | string        | null: false | 
| prefecture    | integer       | null: false |
| city          | string        | null: false |
| house_number  | string        | null: false |
| building_name | string        |             |
| phone_number  | string        | null: false |

### Association

- belongs_to :order
