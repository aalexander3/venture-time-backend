Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :investors
      resources :start_ups
      resources :start_up_investors, only: [:index, :create]
      resources :messages, only: [:create]
      post '/login', to: 'sessions#create'
      post '/authorize', to: 'sessions#reauth'
    end
  end
  mount ActionCable.server => '/cable'
end
