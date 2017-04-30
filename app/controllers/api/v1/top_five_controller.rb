class Api::V1::TopFiveController < ApplicationController

  def index
    render json: Provider.where(user_id: params["user_id"]).group(:provider_name).select('SUM(delivered) as delivered', :provider_name).order('delivered desc').first(5).pluck(:provider_name)
  end
end
