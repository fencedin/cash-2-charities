CashForCharity::Application.routes.draw do
  root to: 'charities#index'
  devise_for :users
  resources :charities
  resources :charges, only: [:new, :create]
end
