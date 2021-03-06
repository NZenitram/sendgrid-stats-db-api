class Api::V1::ProvidersController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action  :verify_authenticity_token

  def index
    render json: Provider.all
  end

  def show
    user_id = params["user_id"].to_i
    render json: Provider.where(user_id: user_id)
  end

  def create
    Api::V1::ProvidersHelper.save_providers_to_database(params['providers'])
    Api::V1::ProvidersPercentagesHelper.save_providers_percentages_to_database(params['providers'])
  end

  def names
    render json: Provider.where(user_id: params["user_id"]).group(:provider_name).select('SUM(delivered) as delivered', :provider_name).order('delivered desc').first(50).pluck(:provider_name)
  end

  def provider
    render json: Provider.where(provider_name: params["provider"])
  end

  def delivered
    event = params["event"].to_sym
    render json: Provider.where(provider_name: params["provider"], user_id: params["user_id"]).pluck(:utc_date, event)
  end

  def destroy
    Provider.where(user_id: params["user_id"]).destroy_all
    GlobalStat.where(user_id: params["user_id"]).destroy_all
    ProviderPercentage.where(user_id: params["user_id"]).destroy_all
  end

end
