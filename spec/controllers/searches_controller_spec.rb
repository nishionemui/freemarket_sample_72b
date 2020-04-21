require 'rails_helper'
describe ProductsController, type: :controller  do
  describe 'GET #search' do
    it "商品名を書かないと検索できないこと" do
      get :search
      expect(response).to render_template :search
    end
    # it "商品検査した時商品表示されること" do
    #   get :search, params: { : params[:keyword] }
    #   expect(response).to render_template :search

    # end
  end
end
