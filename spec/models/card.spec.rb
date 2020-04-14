require 'rails_helper'
describe Card do
  describe '#create' do
    it "user_idがない場合は登録できないこと" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end
    it "user_idがない場合は登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
    it "user_idがない場合は登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
  end
  RSpec.describe Card, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end