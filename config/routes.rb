Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # Providers Data
      get '/providers', to: 'providers#index'
      post '/providers', to: 'providers#create'
      get '/providers-destroy/:user_id', to: 'providers#destroy'
      get '/providers/:user_id', to: 'providers#show'
      get '/providers-names/:user_id', to: 'providers#names'
      # get '/providers-names/:provider', to: 'providers#provider'
      # Provider Events Data
      get '/provider-delivered/:provider/:event/:user_id', to: 'providers#delivered'
      # Global Stats Data
      get '/global-stats', to: 'global_stats#index'
      post '/global-stats', to: 'global_stats#create'
      get '/global-stats/:user_id', to: 'global_stats#show'
      get '/global-events/:event/:user_id', to: 'global_stats#events'
      # Top Five Providers
      get '/top-five/:user_id', to: 'top_five#index'
      # Provider Percentage Data
      get '/provider-percentages', to: 'provider_percentages#index'
      get '/provider-percentages/:user_id', to: 'provider_percentages#show'
      get '/provider-percentages/:provider/:event/:user_id', to: 'provider_percentages#events'
    end
  end

end
