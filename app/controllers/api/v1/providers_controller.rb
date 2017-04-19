class Api::V1::ProvidersController < ApplicationController

  def index
    render json: Provider.all
  end

  def show
    user_id = params["user_id"].to_i
    render json: Provider.where(user_id: user_id)
  end



  def create
    Api::V1::ProvidersHelper.save_providers_to_database(params['providers'])
  end
end
