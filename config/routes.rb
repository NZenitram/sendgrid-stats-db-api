Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/providers', to: 'providers#create'
      get '/providers/:user_id', to: 'providers#index'
    end
  end

end
