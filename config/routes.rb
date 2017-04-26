Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/providers', to: 'providers#index'
      post '/providers', to: 'providers#create'
      get '/providers/:user_id', to: 'providers#show'
      get '/providers-names', to: 'providers#names'
      get '/providers-names/:provider', to: 'providers#provider'
      get '/provider-delivered/:provider/:event', to: 'providers#delivered'
      get '/global-stats', to: 'global_stats#index'
      post '/global-stats', to: 'global_stats#create'
      get '/global-stats/:user_id', to: 'global_stats#show'
      get '/global-events/:event', to: 'global_stats#events'
    end
  end

end
