class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_many :main_category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for   :images, allow_destroy: true
  has_many :comments, dependent: :destroy

  belongs_to_active_hash :condition, presence: true
  belongs_to_active_hash :size, presence: true
  belongs_to_active_hash :delivery_fee, presence: true
  belongs_to_active_hash :delivery_date, presence: true
  belongs_to_active_hash :delivery_way, presence: true
  belongs_to_active_hash :prefecture, presence: true

  validates :images,
            :product_name,
            :description,
            :condition,
            :category_id,
            :size,
            :delivery_fee,
            :delivery_way,
            :prefecture,
            :delivery_date,
            :price, 
            presence: true

  def self.search(search)
    if search
      Product.where('product_name LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end
