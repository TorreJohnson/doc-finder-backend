Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :create, :destroy]
      resources :doctor_database, only: [:index, :show]
      resources :google, only: [:create]
    end
  end

end
