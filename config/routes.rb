Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events
  resources :churches do
    resources :services, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/dashboard', to: 'dashboard#index'
  get '/about', to: 'pages#about'
  get '/benefits', to: 'pages#benefits'
  get '/contact', to: 'pages#contact'
end
