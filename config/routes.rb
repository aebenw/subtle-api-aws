Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      delete '/relationships', to: 'relationships#destroy'
      resources :blocks
      resources :channels
      resources :users
      resources :relationships, except: [:destroy]
    end
  end
end
