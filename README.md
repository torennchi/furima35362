# README





| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| birthday           | string | null: false  |

### Association

has_many :items
has_many :buyer record







| Column             | Type       | Options                       |
| ------             | ------     | -----------                   |
| product name       | string     | null: false                   |
| category_id        | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |
| explanation        | text       | null: false                   |
| status_id          | integer    | null: false                   |
| cost_id            | integer    | null: false                   |
| area_id            | integer    | null: false                   |
| days_id            | integer    | null: false                   |

### Association
has_many :users
has_many :address
has_one :buyer record








| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| purchased items   | references | null: false                   |


### Association
has_one :items
has_many :users




## address テーブル



| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| phone number      | references | null: false                   |
| postal code       | references | null: false                   |
| prefectures       | references | null: false                   |
| municipalities    | references | null: false                   |
| address           | references | null: false                   |
| building name     | references | null: false                   |


### Association
has_many :items

