class Api::V1::ProviderPercentagesController < ApplicationController
  def index
    render json: ProviderPercentage.all
  end

  def show
    user_id = params["user_id"].to_i
    render json: ProviderPercentage.where(user_id: user_id)
  end

  def events
    event = params["event"].to_sym
    render json: ProviderPercentage.where(provider_name: params["provider"], user_id: params["user_id"]).pluck(:utc_date, event)
  end
end
