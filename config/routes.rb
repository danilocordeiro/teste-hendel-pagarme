Rails.application.routes.draw do
  resources :split_rules
  resources :information
  resources :transactions
  resources :recipients
  devise_for :members
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
