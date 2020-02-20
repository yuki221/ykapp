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

  get 'tags/:tag', to: 'posts#index', as: :tag #追加

  get "posts/show/:id" => "posts#show"
  delete 'posts/show/:id' => 'posts#destroy'
  root "pages#home"

  resources :posts,          only: [:create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
