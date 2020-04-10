class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# < バリデーション >
# < 空ではない >
  validates :nickname,
            :first_name, 
            :last_name,
            :first_name_read,
            :last_name_read,
            :phone_num,
            presence: true
# < 全角カナ >
  validates :first_name_read,
            :last_name_read,
            format: {with:/\A[ァ-ヶー－]+\z/}
# < 一致してないかどうか >
  validates :email,uniqueness: true

# < アソシエーション >
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address
  accepts_nested_attributes_for :address
  has_many :cards

# < イメージアップローダー >
  mount_uploader :user_image, ImageUploader
end
