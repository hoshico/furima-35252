# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | text   | null: false               |
| last_name_kana  | text   | null: false               |
| first_name_kana | text   | null: false               |
| birthday        | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type          | Options     |
| ------------------- | ------------- | ----------- |
| image               | ActiveStorage | null: false | 
| info                | text          | null: false |
| category            | date          | null: false |
| status              | date          | null: false |
| shipping_fee_status | date          | null: false |
| prefecture          | date          | null: false |
| scheduled_delivery  | date          | null: false |
| price               | string        | null: false |
| user                | references    |             |


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column              | Type          | Options     |
| ------------------- | ------------- | ----------- |
| postal_code         | string        | null: false | 
| prefecture          | date          | null: false |
| city                | string        | null: false |
| address             | string        | null: false |
| building            | string        |             |
| phone_number        | string        | null: false |
| user                | references    |             |
| item                | references    |             |


### Association

- belongs_to :user
- belongs_to :item

