## users

|Column            |Type           |Options                         |
|----------------- |-------------- |------------------------------- |
|email             | string        | null: false, unique: true      |
|nickname          | string        | null: false, unique: true      |
|encrypted_password| string        | null: false                    |
|birth_date        | date          | null: false                    |
|first_name        | string        | null: false                    |
|last_name         | string        | null: false                    |
|first_name_kana   | string        | null: false                    |
|last_name_kana    | string        | null: false                    |


### Association
- has_many :items
- has_many :purchases

## items

|Column                 |Type           |Options                         |
|---------------------- |-------------- |------------------------------- |
|name                   | string        | null: false                    |
|price                  | integer       | null: false                    |
|introduction           | text          | null: false                    |
|category_id            | integer       | null: false                    |
|state_id               | integer       | null: false                    |
|burden_of_delivery_id  | integer       | null: false                    |
|prefecture_id          | integer       | null: false                    |
|shipment_date_id       | integer       | null: false                    |
|user                   | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases

|Column                 |Type           |Options                         |
|---------------------- |-------------- |------------------------------- |
|user                   | references    | null: false, foreign_key: true |
|item                   | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

|Column                 |Type           |Options                         |
|---------------------- |-------------- |------------------------------- |
|postal_code            | string        | null: false                    |
|prefecture_id          | integer       | null: false                    |
|municipality           | string        | null: false                    |
|address                | string        | null: false                    |
|building_name          | string        |                                |
|phone_number           | string        | null: false                    |
|purchase               | references    | null: false, foreign_key: true |

### Association
- belongs_to :purchase