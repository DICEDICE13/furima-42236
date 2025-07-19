# FURIMA-42236のテーブル設計（ER図）

## users テーブル
| Column              | Type       | Options                         |
| ------------------  | ---------- | ------------------------------- |
| nickname	          | string     |	null: false,       | 
| email               | string     |	null: false, unique: true      | 
| encrypted_password  | string     |	null: false                    |
| last_name           | string     |  null: false                    |
| first_name          | string     |  null: false                    |
| last_name_kana      | string     |  null: false                    |
| first_name_kana	    | string     |  null: false                    |
| birthday            | date       |  null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name	             | string     |	null: false                     |
| description        | text       |	null: false                     |
| category	         | string     |	null: false                     |
| shipping_info	     | string     |	null: false                     |
| price	             | integer    |	null: false                     |
| image              | string     |	null: false                     |
| user_id	           | integer    |	null: false                     |
| timestamps         | datetime   |	null: false                     |

### Association
- belongs_to :user
- has_oen :order


## ordersテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | string     |	null: false                     |
| address	           | string   	| null: false                     |
| phone_number	     | string	    | null: false                     |
| user_id            | integer    |	null: false                     |
| item_id            | integer    |	null: false                     |
| timestamps         | datetime   |	null: false                     |

### Association
- belongs_to :user
- belongs_to :item

