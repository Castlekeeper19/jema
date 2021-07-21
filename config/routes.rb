Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events
  resources :ministries, only: [:index, :show]
  resources :churches do
    resources :services, only: [:new, :create, :edit, :update, :destroy]
  end

# routes to static pages
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/churches', to: 'dashboard#churches'
  get '/dashboard/events', to: 'dashboard#events'
  get '/dashboard/ministries', to: 'dashboard#ministries'
  get '/dashboard/resources', to: 'dashboard#resources'



  get '/about', to: 'pages#about'
  get '/benefits', to: 'pages#benefits'
  get '/contact', to: 'pages#contact'

# routes to resources pages
  get '/growth', to: 'resources#growth'
  get '/care', to: 'resources#care'
  get '/practical', to: 'resources#practical'
  get '/training', to: 'resources#training'
end
