CashForCharity::Application.routes.draw do
  root to: 'charities#index'
  devise_for :users
  resources :charities
end
