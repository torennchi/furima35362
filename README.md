# README

## users テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| birthday           | date   | null: false              |
| surname            | string | null: false              |
| name               | string | null: false              |
| kana_surname       | string | null: false              |
| kana_name          | string | null: false              |

### Association

has_many :items
has_many :buyer_records

## items テーブル

| Column             | Type       | Options                       |
| ------             | ------     | -----------                   |
| product_name       | string     | null: false                   |
| category_id        | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |
| explanation        | text       | null: false                   |
| status_id          | integer    | null: false                   |
| cost_id            | integer    | null: false                   |
| area_id            | integer    | null: false                   |
| shipping_day_id            | integer    | null: false                   |

### Association
belongs_to :user
has_one :buyer_record


## buyer_records テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| item              | references | null: false foreign_key: true |


### Association
belongs_to :item
belongs_to :user
has_one :address




## addresses テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| buyer_record      | references | null: false foreign_key: true |
| phone_number      | string     | null: false                   |
| postal_code       | string     | null: false                   |
| area_id           | integer    | null: false                   |
| municipalities    | string     | null: false                   |
| address           | string     | null: false                   |
| building_name     | string     |                               |


### Association
belongs_to :buyer_record
