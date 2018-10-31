Rails.application.routes.draw do

  get '/auth', to: 'auth#create'
  resources :blocks
  resources :channels
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
