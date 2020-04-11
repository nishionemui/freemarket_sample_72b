Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "products#index"

  resources :signup, only: [:index, :show]
  resources :users, only: [:show, :create, :new, :destroy,:update] do
    member do
      get 'profile'
      get 'card'
      get 'address'
    end
    collection do
      get 'signout/:id'=> 'users#singout', as: 'signout'
    end
  end

  resources :cards, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'cards#delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
  end 
  
  resources :products do
    resources :comments, only: [:create, :destroy, :show]
    collection do
      get 'purchase/:id'=> 'products#purchase', as: 'purchase'
      post 'pay/:id'=> 'products#pay', as: 'pay'#httpメソッドはpostなので注意
      get 'done/:id'=> 'products#done', as: 'done'
      delete 'products/:id' => 'products#destroy'
      # get 'get_category_children', defaults: { format: 'json' }
      # get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'products/new/mid_category', to: 'products#mid_category'
      get 'products/new/small_category', to: 'products#small_category'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
