## users

|Column            |Type           |Options                         |
|----------------- |-------------- |------------------------------- |
|email             | string        | null: false, unique: true      |
|nickname          | string        | null: false, unique: true      |
|encrypted_password| string        | null: false                    |
|date              | string        | null: false                    |
|first_name        | string        | null: false                    |
|last_name         | string        | null: false                    |
|first_name(kana)  | string        | null: false                    |
|last_name(kana)   | string        | null: false                    |


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
|burden-of-delivery_id  | integer       | null: false                    |
|shipment- source_id    | integer       | null: false                    |
|shipment-date_id       | integer       | null: false                    |
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
|postal-code            | string        | null: false                    |
|prefectures_id         | integer       | null: false                    |
|municipality           | string        | null: false                    |
|address                | string        | null: false                    |
|building-name          | string        |                                |
|phone-number           | string        | null: false                    |
|purchase               | references    | null: false, foreign_key: true |

### Association
- belongs_to :purchase