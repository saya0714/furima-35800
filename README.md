# README

## users テーブル

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |              
| name                | string | null: false                |
| email               | string | null: false, unique: true  |
| encrypted_password  | string | null: false                |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_kana      | string | null: false                |
| first_name_kana     | string | null: false                |
| birthday            | date   | null: false                |

### Association

- has_many : items
- has_many : histories
- has_many :comments
- has_one :card


## items テーブル

| Column              | Type      | Options                         |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| delivery_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association

- belongs_to : user
- has_one : history
- has_many :comments


## histories テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false, foreign_key: true  |                   
| item                | references | null: false, foreign_key: true  |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address


## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |                   
| postal_code         | string     | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| city_name           | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |  |
| phone_number        | string     | null: false                    |
| history             | references | null: false, foreign_key: true |

### Association

- belongs_to : history


## comments テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false, foreign_key: true  |
| item                | references | null: false, foreign_key: true  |
| text                | text       | null: false                     |

### Association

- belongs_to :item
- belongs_to :user 


## cards テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false, foreign_key: true  |
| customer_token      | string     | null: false                     |

### Association

- belongs_to :user