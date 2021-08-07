# README





| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |






| Column             | Type       | Options                       |
| ------             | ------     | -----------                   |
| product name       | string     | null: false                   |
| category           | text       | null: false                   |
| price              | text       | null: false                   |
| user               | references | null: false foreign_key: true |
| explanation        | string     | null: false                   |
| status             | string     | null: false                   |
| cost               | string     | null: false                   |
| area               | string     | null: false                   |
| days               | string     | null: false                   |






| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| purchased items   | references | null: false                   |





| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| user              | references | null: false foreign_key: true |
| phone number      | references | null: false                   |

