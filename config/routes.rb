Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/providers', to: 'providers#create'
    end
  end

end
