class Product < ApplicationRecord
  belongs_to :user
  has_many :main_categories, dependent: :destroy
  # has_many :images, dependent: :destoroy  
  has_many :images
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :prefecture
 
  add_index :products, :product_name

end
