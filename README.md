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
| category_id	       | integer    |	null: false                     |
| shipping_fee_status_id   | integer    |	null: false                     |
| price	             | integer    |	null: false                     |
| user	             | references |	null: false,foreign_key: true   |
| status_id	         | integer    | null: false                     |
| delivery_day_id	   | integer	  | null: false                     |
| prefecture_id	     | integer    | null: false                     | 

### Association
- belongs_to :user
- has_one :order



## ordersテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user	             | references |	null: false, foreign_key: true  |
| item		           | references	| null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## shipping_addressesテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | string     |	null: false                     |
| prefecture_id      | integer   	| null: false                     |
| city	             | string	    | null: false                     |
| address_line	     | string	    | null: false                     |
| building_name      | string	    |                                 |
| phone_number       | string	    | null: false                     |
| order_id           | references | null: false, foreign_key: true  |

### Association
- belongs_to :order
