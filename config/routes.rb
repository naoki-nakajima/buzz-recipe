Rails.application.routes.draw do
  devise_for :shop_admins, controllers: {
    sessions: 'shop_admins/sessions',
    password: 'shop_admins/passwords',
    registrations: 'shop_admins/registrations'
  }
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_login'
  end
  
  root "posts#index"

  resources :shop_admins do
    resources :menus do
      resources :photos
    end
    resources :shop_infos
    resources :business_dates
    resources :shop_commitments do
      resources :photos
    end
  end

  resources :likes, only: %i(create destroy)
  resources :comments, only: %i(create destroy)
  resources :users, only: %i(index show edit) 
  
  get '/photo/hashtag/:name', to: 'posts#hashtag'
end

