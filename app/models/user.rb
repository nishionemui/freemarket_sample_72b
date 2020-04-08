class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# < バリデーション >
# < 空ではない >
#   validates :nickname,
#             :first_name, 
#             :last_name,
#             :first_name_read,
#             :last_name_read,
#             :phone_num,
#             :birthday,presence: true
# # < 全角カナ >
#   validates :first_name_read,
#             :last_name_read,
#             format: {with:/\A[ァ-ヶー－]+\z/}
# # < 電話番号 3桁-4桁-4桁 >
#   validates :phone_num,
#             format:{with: /\A\d{10,11}\z/}
# # < 一致してないかどうか >
#   validates :email,
#             :nickname, 
#             :phone_num,
#             uniqueness: true


  # has_many :products
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address
  # has_one :card
  belongs_to :card
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :card

  mount_uploader :user_image, ImageUploader
 
end
