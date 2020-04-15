require 'rails_helper'
describe Address do
  describe '#create' do
    it "zip_codeがない場合は登録できないこと" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end
    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end
    it "cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "address1がない場合は登録できないこと" do
      address = build(:address, address1: nil)
      address.valid?
      expect(address.errors[:address1]).to include("を入力してください")
    end
    it "zip_codeが3桁-4桁でない場合は登録できないこと" do
      address = build(:address, zip_code: "123-4567")
      address.valid?
      expect(address).to be_valid
    end
    it "zip_code不適切 " do
      user = build(:address, zip_code: "a00-0000")
      user.valid?
      expect(user).to be_invalid(:validates_address)
    end
  end
end