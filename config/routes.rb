Rails.application.routes.draw do
  get 'spot_pages/night'
  get 'spot_pages/dinner'
  get 'users/new'

  devise_for :users

  get 'pages/index'
  get 'pages/show'
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'

  get 'users/show'
  get 'users/index'

  get 'posts/new'
  get 'posts/index'

  get 'posts/night'
  get 'posts/dinner'
  get 'posts/cafe'
  get 'posts/sweets'
  get 'posts/shopping'
  get 'posts/themepark'

  get 'tags/:tag', to: 'posts#index', as: :tag #追加

  get "posts/show/:id" => "posts#show"
  delete 'posts/show/:id' => 'posts#destroy'

  get 'users/show/:id' => 'users#show'

  root "pages#home"

  resources :posts,          only: [:create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
