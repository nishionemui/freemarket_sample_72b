class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_many :main_categories, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for   :images, allow_destroy: true
  has_many :comments, dependent: :destroy

  belongs_to_active_hash :brand, presence: true
  belongs_to_active_hash :condition, presence: true
  belongs_to_active_hash :size, presence: true
  belongs_to_active_hash :delivery_fee, presence: true
  belongs_to_active_hash :delivery_date, presence: true
  belongs_to_active_hash :delivery_way, presence: true
  belongs_to_active_hash :prefecture, presence: true

  validates :images, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :size, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_way, presence: true
  validates :prefecture, presence: true
  validates :delivery_date, presence: true
  validates :price, presence: true
  # add_index :products, :product_name
end
