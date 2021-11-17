Rails.application.routes.draw do



  resources :customers =
  namespace :admin do
    resources :customers
  end

  resources :addresses
  namespace :admin do
  resources :addresses
  end




  devise_for :customers,skip: [:passwords,], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins,skip: [:registrations, :passwords] ,controllers:{
    sessions: "admin/sessions"
  }
end
