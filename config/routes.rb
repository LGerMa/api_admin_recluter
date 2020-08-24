Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #91684785
      get '/users/me', to: 'users#me', as: 'user_me'
      resources :countries, only: [:index, :create, :show, :update]
    end
  end
end
