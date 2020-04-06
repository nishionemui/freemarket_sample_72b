class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # has_many :products
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address
  has_one :card
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :card
  mount_uploader :user_image, ImageUploader
end
