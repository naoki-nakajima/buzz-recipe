Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_login'
  end
  
  root "posts#index"
  
  
  get '/photo/hashtag/:name', to: 'posts#hashtag'

  resources :posts do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    collection do
      get :search
    end
  end
  resources :users, only: %i(index show edit)
end

