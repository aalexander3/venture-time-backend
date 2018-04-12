Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :investors
      resources :start_ups
      resources :start_up_investors
    end
  end
end
