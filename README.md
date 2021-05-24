# テーブル設計

## users テーブル
| Column                | Type    | Options                   |
| --------------------  | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| first_name_kana       | string  | null: false               |
| last_name_kana        | string  | null: false               |
| birthday              | date    | null: false               |
### Association
- has_many :items
- has_many :comments
- has_many :buyer



## items テーブル
| Column        | Type       | Options     |
| ---------     | -----------| ----------- |
| title         | string     | null: false |
| description   | text       | null: false |
| category_id   | integer    | null: false |
| status_id     | integer    | null: false |
| shipping_id   | integer    | null: false |
| area_id       | integer    | null: false |
| lead_time_id  | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many :comments
- has_one :buyer


## comments テーブル
| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item

## buyers テーブル
| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column        | Type       | Options     |
| ------------  | ---------- | ----------- |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| post_number   | string     | null: false |
| phone_number  | string     | null: false |
### Association
- belongs_to :buyer
