Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :jsonapi } do
    namespace :v1 do
      get '/students', to: 'students#index'
      patch '/student', to: 'students#update'
      delete '/student', to: 'students#destroy'
    end
  end

  scope path: 'api/v1' do
    api_guard_routes for: 'students',
                     controller: {
                       registration: 'api/v1/registration',
                       authentication: 'api/v1/authentication',
                       passwords: 'api/v1/passwords',
                       tokens: 'api/v1/tokens'
                     }
  end
end
