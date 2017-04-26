class Api::V1::GlobalStatsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token

  def index
    render json: GlobalStat.all
  end

  def create
    Api::V1::GlobalStatsHelper.save_providers_to_database(params['globals'])
  end

  def show
    user_id = params["user_id"].to_i
    render json: GlobalStat.where(user_id: user_id)
  end

  def events
    event = params["event"].to_sym
    render json: GlobalStat.pluck(:utc_date, event)
  end
end
