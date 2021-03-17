Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_login'
  end
  
  root "posts#index"
  
  get '/users/:id', to: 'users#show', as: 'user'
  get '/post/hashtag/:name', to: 'posts#hashtag'

  resources :posts do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  resources :foods, only: %i(new create)
end

