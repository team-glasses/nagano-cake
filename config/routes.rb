Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords,], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #後で削除
  devise_scope :customer do
    get '/customers/sign_out' => 'public/sessions#destroy'
  end

  devise_for :admin,skip: [:registrations, :passwords] ,controllers:{
    sessions: "admin/sessions"
  }

#homes
 root :to => "public/homes#top"
 get 'homes/about' => "public/homes#about"

 namespace :admin do
   root :to => "homes#top"
  end


#customers
  patch 'customers/withdrawal' => 'public/customers#withdrawal', as: 'withdrawal'
  resources :customers, only: [:edit, :update ], module: :public
  get 'customers/my_page' => 'public/customers#show'
  get 'customers' => 'public/customers#check'

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end


#addresses
  resources :addresses, expect: [:show, :new], module: :public


#items
  resources :items, only: [:index, :show], module: :public

  namespace :admin do
    resources :items, expect: [:destroy]
  end



#cart_items
  resources :cart_items, only: [:index, :create, :update, :destroy], module: :public
  delete 'cart_items' => 'public/cart_items#destroy_all'


#orders
  resources :orders, only: [:new, :confirm, :create, :index, :show], module: :public
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'

  namespace :admin do
    resources :orders, only: [:show, :update]
  end


#categories
  namespace :admin do
    resources :categories, only: [:index, :create, :edit, :update]
  end


#order_items
  namespace :admin do
    resources :order_items, only: [:update]
  end

end
