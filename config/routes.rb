Rails.application.routes.draw do
  root 'camps#index'
  resources :camps
end
