Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      delete '/relationships', to: 'relationships#destroy'
      get '/content', to: 'users#content'
      post '/ChannelBlock', to: 'channel_block#create'
      post '/channels/followers', to: 'channels#channel_follower'



      resources :comments
      resources :blocks
      resources :channels
      resources :users
      resources :relationships, except: [:destroy]
    end
  end

  post '/rails/active_storage/direct_uploads' => 'direct_uploads#create'
  # resources :active_storage

  # namespace :rails do
  #   namespace :v1 do
  #
  #     resources :active_storage
  #   end
  # end
end
