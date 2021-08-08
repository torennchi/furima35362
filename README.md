# README



## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| birthday           | string | null: false  |
| name               | string | null: false  |
| kana_name          | string | null: false  |


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
| days_id            | integer    | null: false                   |

### Association
has_one :users
has_one :buyer_records






## buyer_record テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| purchased_items   | references | null: false foreign_key: true |


### Association
has_many :items
has_many :users
has_one :address




## address テーブル



| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| phone_number      | string     | null: false                   |
| postal_code       | string     | null: false                   |
| prefectures       | string     | null: false                   |
| municipalities    | string     | null: false                   |
| address           | string     | null: false                   |
| building_name     | string     | null: false                   |


### Association
has_many :items

