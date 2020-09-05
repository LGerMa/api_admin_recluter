Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #91684785
      get '/users/me', to: 'users#me', as: 'user_me'
      resources :countries
      resources :banks
      resources :candidates do
        resources :phones
        resources :documents
        resources :work_experiences
      end

      resources :companies do
        resources :documents
        resources :company_contacts
        resources :company_jobs
      end
    end
  end
end
