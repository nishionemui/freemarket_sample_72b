Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "products#index"
  # get "signup", to: "signup#index"
  resources :signup, only: [:index]
  resources :users, only: [:show, :create, :new] do
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'
    end
  end
  
  # get "signup", to: "signup#index"
  # resources :signup do
  #   collection do
  #     get 'step1'
  #     post 'step2'
  #     post 'step3'  #入力が全て完了
  #     get 'complete_signup'  #登録完了後
  #   end
  # end       

  resources :cards, only: [:show, :new, :create, :edit, :update, :destroy] do
  end
  
  # root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
