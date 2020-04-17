require 'rails_helper'

RSpec.describe SnsCredential, type: :model do

  describe '#create' do
    it "providerがない場合は登録できないこと" do
      user = build(:sns_credential, provider: nil)
      user.valid?
      expect(user.errors[:provider]).to include("を入力してください")
    end
    it "uidがない場合は登録できないこと" do
      user = build(:sns_credential, uid: nil)
      user.valid?
      expect(user.errors[:uid]).to include("を入力してください")
    end
  end
end


