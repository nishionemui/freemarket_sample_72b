class Product < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :main_categories, dependent: :destroy
  # has_many :images, dependent: :destoroy  
  has_many :images
  has_many :comments, dependent: :destroy
  validates :brand, presence: true
  validates :condition, presence: true
  validates :size, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_date, presence: true
  validates :delivery_way, presence: true
  validates :prefecture, presence: true

  # add_index :products, :product_name

end
