class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  # < イメージアップローダー >
  mount_uploader :user_image, UserImageUploader
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
  validates :email,:phone_num,uniqueness: true
  # < パスワード7文字以上 >
  validates :password,length: { minimum: 7}
  # < アソシエーション >  
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :cards, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product
  has_many :sns_credentials,dependent: :destroy
  # < sns 認証 >
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?  #userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }  #User.form_omniauth、メゾットでuserとsnsをハッシュで返す
  end

  
  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)
  #   if params[:password].blank? && params[:password_confirmation].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation)
  #   end
   
  #   result = update_attributes(params, *options)
  #   clean_up_passwords
  #   result
  # end
end
