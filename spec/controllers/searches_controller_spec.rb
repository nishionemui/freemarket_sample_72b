require 'rails_helper'
describe ProductsController, type: :controller  do
  describe 'GET #search' do
    it "クリックすると検索ページに遷移すること" do
      get :search
      expect(response).to render_template :search
    end
  end 
  
    it "商品キーワードを入力した時キーワードの商品表示されること" do
      search = build(:product, product_name: "hoge")
      get :search, params: params
      expect(response).to render_template :search
  end
end
