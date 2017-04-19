class Api::V1::ProvidersController < ApplicationController

  def create
    Api::V1::ProvidersHelper.save_providers_to_database(params['providers'])
  end
end
