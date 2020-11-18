## users

|Column     |Type           |Options                         |
|---------- |-------------- |------------------------------- |
|email      | string        | null: false, unique: true      |
|nickname   | string        | null: false, unique: true      |
|password   | string        | null: false                    |
|name       | string        | null: false                    |
|birth      | string        | null: false                    |
|user       | references    | null: false, foreign_key: true |

### Association
- has_many :items
- has_many :purchases

## items

|Column                 |Type           |Options                         |
|---------------------- |-------------- |------------------------------- |
|name                   | string        | null: false                    |
|price                  | integer       | null: false                    |
|introduction           | text          | null: false                    |
|category               | text          | null: false                    |
|state                  | text          | null: false                    |
|burden-of-delivery     | text          | null: false                    |
|shipment- source       | text          | null: false                    |
|shipment-date          | text          | null: false                    |
|image                  | ActiveStorage | null: false                    |
|user_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchases

## purchases

|Column                 |Type           |Options                         |
|---------------------- |-------------- |------------------------------- |
|credit-number          | integer       | null: false                    |
|expiration-date        | integer       | null: false                    |
|security-code          | integer       | null: false                    |
|user_id                | references    | null: false, foreign_key: true |
|address_id             | references    | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :items

## addresses

|Column                 |Type           |Options      |
|---------------------- |-------------- |------------ |
|postal-code            | integer       | null: false |
|prefectures            | text          | null: false |
|municipality           | text          | null: false |
|address                | text          | null: false |
|building-name          | text          |             |
|phone-number           | integer       | null: false |

### Association
- has_one :purchases