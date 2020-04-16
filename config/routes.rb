Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do                                           #ウィザード形式
    get 'addresses', to: 'users/registrations#new_address'        #住所入力ページ
    post 'addresses', to: 'users/registrations#create_address'    #住所入力保存アクション
  end
  root to: "products#index"

  resources :signup, only: [:index]                   #新規登録洗濯ページ
  resources :users, only: [:show, :create, :new, :destroy,:update] do
    member do
      get 'profile'       #プロフィール変更ページ
      get 'card'          #クレカ追加ページ
      get 'address'       #住所変更ページ
      get 'introduce'     #本人情報変更ページ
      get 'phone'         #電話番号変更ページ
    end
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'    #ログアウト確認ページ
      get 'deletion'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
