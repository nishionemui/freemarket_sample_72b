require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "last_name  がない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name  ]).to include("を入力してください")
    end
    it "first_name_readがない場合は登録できないこと" do
      user = build(:user, first_name_read: nil)
      user.valid?
      expect(user.errors[:first_name_read]).to include("を入力してください")
    end
    it "last_name_readがない場合は登録できないこと" do
      user = build(:user, last_name_read: nil)
      user.valid?
      expect(user.errors[:last_name_read]).to include("を入力してください")
    end
    it "phone_num がない場合は登録できないこと" do
      user = build(:user, phone_num: nil)
      user.valid?
      expect(user.errors[:phone_num ]).to include("を入力してください")
    end
    it " 重複したemailが存在する場合は登録できないこと " do
      user = build(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(user).to be_valid
    end
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end
    it "first_name_readがカタカナではない場合は登録できないこと" do
      user = build(:user, first_name_read: nil)
      user.valid?
      expect(user.errors[:first_name_read]).to include( "は不正な値です")
    end
    it "last_name_readがカタカナではない場合は登録できないこと" do
      user = build(:user, last_name_read: nil)
      user.valid?
      expect(user.errors[:last_name_read]).to include( "は不正な値です")
    end
  end
end