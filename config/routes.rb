Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/providers', to: 'providers#index'
      post '/providers', to: 'providers#create'
      get '/providers/:user_id', to: 'providers#show'
      get '/providers-names', to: 'providers#names'
      get '/providers-names/:provider', to: 'providers#provider'
      get '/provider-delivered/:provider/:event', to: 'providers#delivered'
      post '/global-stats', to: 'global_stats#create'
    end
  end

end
