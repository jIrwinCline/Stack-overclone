Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions do
    resources :responses
  end
  resources :users
end
