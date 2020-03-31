# README

# freemarket_sample_72b DB設計

## usersテーブル 
|Column|Type|Options|
|------|----|-------|
|email             |string |null: false|
|encrypted_password|string |null: false|
|nickname          |string |null: false|
|user_image        |text   ||
|first_name        |string |null:false|
|last_name         |string |null:false|
|first_name_read   |string |null:false|
|last_name_read    |string |null:false|
|birthday          |date   |null: false|
|introduction      |text   ||
|phone_num         |integer|null: false, unique: true|
### Association
- has_many :products
- has_many :comments
- has_one :card
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code     |string    |null: false|
|prefecture_id|integer   |null: false|
|city         |string    |null: false|
|address1     |string    ||
|address2     |string    ||
|user         |references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user    |references|null: false, foreign_key: true|
|card    |references|null: false, foreign_key: true|
|token   |string    |null: false|
|customer|references|null: false|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user         |references|null: false, foreign_key: true|
|product_name |string    |null: false|
|description  |text      |null: false, foreign_key: true|
|brand        |references|null: false, foreign_key: true|
|condition    |references|null: false, foreign_key: true|
|size         |references|null: false, foreign_key: true|
|delivery_fee |references|null: false, foreign_key: true|
|delivery_way |references|null: false, foreign_key: true|
|delivery_date|references|null: false, foreign_key: true|
|price        |integer   |null: false|
|prefecture   |references|null: false, foreign_key: true|
|buyer_id     |integer   |null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :main_categories
- has_many_attached :images
- add_index :products, :product_name
- has_many :comment
- belongs_to_active_hash :brands
- belongs_to_active_hash :condition
- belongs_to_active_hash :size
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_days
- belongs_to_active_hash :delivery_way
- belongs_to_active_hash :prefecture

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|image  |string    |null: false|
### Association
- belongs_to :product

## main_categoiesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|name   |string    |null: false|
### Association
- belongs_to :product
- has_many :sub_categories

## sub_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main_categoies|references|null: false, foreign_key: true|
|name          |string    |null: false|
### Association
- belongs_to :main_category
- has_many :sub2_categories

## sub2_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sub_categoies|references|null: false, foreign_key: true|
|name         |string    |null: false|
### Association
- belongs_to :sub_category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|user   |references|null: false, foreign_key: true|
|text   |text      |null: false|
### Association
- belongs_to :user
- belongs_to :product