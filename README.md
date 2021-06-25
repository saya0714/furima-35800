# README

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many : items
- has_many : histories

## items テーブル

| Column              | Type      | Options                         |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


## Association

- belongs_to : user
- belongs_to : histories


## histories テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false, foreign_key: true  |                   
| item                | references | null: false, foreign_key: true  |

### Association

- belongs_to : user
- has_one : items
- has_one : addresses


## addresses テーブル
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| postal_code         | string  | null: false |
| prefectures         | integer | null: false |
| city_name           | string  | null: false |
| address             | string  | null: false |
| building_name       | string  |             |
| phone_number        | string  | null: false |

### Association

- belongs_to : histories

