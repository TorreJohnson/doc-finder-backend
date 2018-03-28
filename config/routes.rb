Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :google, only: [:create]
    end
  end

  get 'api/v1/doctor_database/doctors', to: 'api/v1/doctor_database#doctors'
  get 'api/v1/doctor_database/insurances', to: 'api/v1/doctor_database#insurances'

end
