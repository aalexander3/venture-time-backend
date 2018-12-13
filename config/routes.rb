Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :investors, only: [:index, :show, :create]
      resources :start_ups, only: [:index, :show, :create]
      resources :start_up_investors, only: [:index, :create]
      resources :messages, only: [:create]
      post '/login', to: 'sessions#create'
      post '/authorize', to: 'sessions#reauth'
    end
  end
  mount ActionCable.server => '/cable'
end
