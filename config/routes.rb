Rails.application.routes.draw do
  devise_for :users
  root 'camps#index'
  resources :camps
end
