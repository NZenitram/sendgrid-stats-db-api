class Api::V1::ProvidersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Provider.all
  end

  def show
    user_id = params["slug"].to_i
    render json: Provider.where(user_id: user_id)
  end

  def create
    Api::V1::ProvidersHelper.save_providers_to_database(params['providers'])
  end

  def names
    render json: Provider.distinct.pluck(:provider_name)
  end

  def provider
    binding.pry
    render json: Provider.where(provider_name: params["provider"]).to_json
  end
end
