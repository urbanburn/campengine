Rails.application.routes.draw do
  root 'camps#index'
  devise_for :users
  resources :camps
end
