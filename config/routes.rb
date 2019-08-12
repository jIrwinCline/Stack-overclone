Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    resources :responses
  end
  resources :users

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
