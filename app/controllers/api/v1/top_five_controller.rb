class Api::V1::TopFiveController < ApplicationController

  def index
    render json: Provider.group(:provider_name).select('SUM(delivered) as delivered', :provider_name).order('delivered desc').first(5).pluck(:provider_name)
  end
end
