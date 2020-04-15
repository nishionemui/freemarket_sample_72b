require 'rails_helper'
describe Product do
  describe '#create' do

    it "product_nameがない場合は登録できないこと" do
      product = build(:product, product_name: nil)
      product.valid?
      expect(product.errors[:product_name]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "sizeがない場合は登録できないこと" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      product = build(:product, delivery_fee: nil)
      product.valid?
      expect(product.errors[:delivery_fee]).to include("を入力してください")
    end

    it "delivery_wayがない場合は登録できないこと" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      product = build(:product, prefecture: nil)
      product.valid?
      expect(product.errors[:prefecture]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      product = build(:product, delivery_date: nil)
      product.valid?
      expect(product.errors[:delivery_date]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
  end

  describe '#update' do

    it "product_nameがない場合は登録できないこと" do
      product = build(:product, product_name: nil)
      product.valid?
      expect(product.errors[:product_name]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "sizeがない場合は登録できないこと" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      product = build(:product, delivery_fee: nil)
      product.valid?
      expect(product.errors[:delivery_fee]).to include("を入力してください")
    end

    it "delivery_wayがない場合は登録できないこと" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      product = build(:product, prefecture: nil)
      product.valid?
      expect(product.errors[:prefecture]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      product = build(:product, delivery_date: nil)
      product.valid?
      expect(product.errors[:delivery_date]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
  end
end