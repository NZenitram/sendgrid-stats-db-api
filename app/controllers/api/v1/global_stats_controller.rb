class Api::V1::GlobalStatsController < ApplicationController
  def create
    Api::V1::GlobalStatsHelper.save_providers_to_database(params['globals'])
  end
end
