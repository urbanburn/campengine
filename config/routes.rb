Rails.application.routes.draw do
  root 'camps#index'
  devise_for :users,
    :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  resources :camps do
    resources :images
  end

  post 'camps/:id/join' => 'camps#join'

end
