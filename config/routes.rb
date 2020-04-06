Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    # get 'addressess', to: 'users/registrationss/edit#edit_address'
    # post 'addressess', to: 'users/registrationss#update_address'
  end
  root to: "products#index"
  # get "signup", to: "signup#index"

  resources :signup, only: [:index, :show]
  resources :users, only: [:show, :create, :new, :destroy,:update] do
    resources :cards, only: [:show, :new, :create, :edit, :update, :destroy] 
    member do
      get 'profile'
      get 'card'
      get 'address'
    end
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'
    end
  end
#   profile_users GET    /users/profile(.:format)                                                                 users#profile
#   card_users GET    /users/card(.:format)                                                                    users#card
# address_users GET    /users/address(.:format)                                                                 users#address



  

  # get "signup", to: "signup#index"
  # resources :signup do
  #   collection do
  #     get 'step1'
  #     post 'step2'
  #     post 'step3'  #入力が全て完了
  #     get 'complete_signup'  #登録完了後
  #   end
  # end       



  resources :products do
    resources :comments, only: [:create, :destroy, :show]
    collection do
      get 'purchase/:id'=> 'tweets#purchase', as: 'purchase'   
      post 'pay/:id'=> 'tweets#pay', as: 'pay'#httpメソッドはpostなので注意
      get 'done'=> 'tweets#done', as: 'done'
      end
  end
  
  # root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
