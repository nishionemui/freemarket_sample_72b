class Product < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :main_categories, dependent: :destroy
  # has_many :images, dependent: :destoroy  
  has_many :images
  has_many :comments, dependent: :destroy

  # belongs_to_active_hash :brand, presence: true
  # belongs_to_active_hash :condition, presence: true
  # belongs_to_active_hash :size, presence: true
  # belongs_to_active_hash :delivery_fee, presence: true
  # belongs_to_active_hash :delivery_date, presence: true
  # belongs_to_active_hash :delivery_way, presence: true
  # belongs_to_active_hash :prefecture, presence: true

  # validates :brand, presence: true
  # validates :condition, presence: true
  # validates :size, presence: true
  # validates :delivery_fee, presence: true
  # validates :delivery_date, presence: true
  # validates :delivery_way, presence: true
  # validates :prefecture, presence: true

  # add_index :products, :product_name

end
