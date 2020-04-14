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
# < 重複してないかどうか >
  validates :email,uniqueness: true
# < パスワード7文字以上 >
  validates :password,length: { minimum: 7}
# < アソシエーション >
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :cards, dependent: :destroy
# < イメージアップローダー >
  mount_uploader :user_image, UserImageUploader

end
