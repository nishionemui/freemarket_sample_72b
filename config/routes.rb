Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do                                           #ウィザード形式
    get 'addresses', to: 'users/registrations#new_address'        #住所入力ページ
    post 'addresses', to: 'users/registrations#create_address'    #住所入力保存アクション
    get 'profile/:id', to: 'users/registrations#edit_profile', as: 'edit_profile'                  #プロフィール変更ページ
    patch 'profile/:id', to: 'users/registrations#update_profile', as: 'update_profile'
    get 'phone/:id', to: 'users/registrations#edit_phone', as: 'edit_phone'                        #電話番号変更ページ
    patch 'phone/:id', to: 'users/registrations#update_phone', as: 'update_phone'
    get 'introduce/:id', to: 'users/registrations#edit_introduce', as: 'edit_introduce'            #本人情報変更ページ
    patch 'introduce/:id', to: 'users/registrations#update_introduce', as: 'update_introduce'
  end
  # root to: "products#index"

  resources :signup, only: [:index]                   #新規登録洗濯ページ
  resources :users, only: [:show, :create, :new, :destroy,:update] do
    member do
      get 'card'          #クレカ追加ページ
      get 'address'       #住所変更ページ
      get 'like'          #いいね一覧ページ
      get 'now'           #出品中
      get 'buyed'         #売却済み
      get 'nowbuy'        #取引中
      get 'mybuy'         #購入した商品
      get 'mybuyed'       #過去に購入した商品
    end
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'    #ログアウト確認ページ
      get 'deletion'
      get 'support'
    end
  end

  resources :cards, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'cards#delete'     #クレカ削除アクション
      post 'show'                           #登録クレカ確認ページ
    end
    member do
      get 'confirmation'                    #クレカ追加ページ
    end
  end 
  
  resources :products do
    resources :comments, only: [:create, :destroy, :show, :index]
    collection do
      get 'purchase/:id'=> 'products#purchase', as: 'purchase'          #購入確認ページ
      post 'pay/:id'=> 'products#pay', as: 'pay'                        #httpメソッドはpostなので注意
      get 'done/:id'=> 'products#done', as: 'done'                      #購入完了ページ
      delete 'products/:id' => 'products#destroy'
      get 'products/new/mid_category', to: 'products#mid_category'
      get 'products/new/small_category', to: 'products#small_category'
      get 'products/list'=> 'products#list'
      get 'search'
    end

  end
  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
