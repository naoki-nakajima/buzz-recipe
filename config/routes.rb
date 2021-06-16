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

  resources :posts do
    namespace :shop_admins do
      resources :posts
    end
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    collection do
      get :search
    end
  end

  resources :shop_infos do
    namespace :shop_admins do
      resources :shop_infos
    end
  end
  
  resources :users, only: %i(index show edit)
  
  get '/photo/hashtag/:name', to: 'posts#hashtag'
end

