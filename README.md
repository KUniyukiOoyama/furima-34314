# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |


## items テーブル

| Column     | Type       | Options     |
| ------     | -----------| ----------- |
| image      | ActiveStrage             |
| title      | string     | null: false |
| description| text       | null: false |
| category   | string     | null: false |
| status     | string     | null: false |
| shipping   | string     | null: false |
| area       | string     | null: false |
| lead_time  | string     | null: false |
| price      | integer    | null: false |
| user       | references | null: false, foreign_key: true |


## comment テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

## buyer テーブル

| Column        | Type       | Options     |
| ------------  | ---------- | ----------- |
| credit_number | string     | null: false |
| expiration    | string     | null: false |
| cvc           | string     | null: false |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone_number  | integer    | null: false |


## earnings テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |