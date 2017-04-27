require 'rails_helper'

describe "provider endpoint" do
  context "POST poviders" do
    before(:each) do
      prov_1 = build_list(:provider, 7, date: "2016-1-01")
      prov_2 = build_list(:provider, 7, date: "2016-1-02")
      prov_3 = build_list(:provider, 7, date: "2016-1-03")
      prov_4 = build_list(:provider, 7, date: "2016-1-04")
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end
    it 'creates perctage data in Provider Perctages table' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', {providers: providers}

      data = ProviderPercentage.first

      
    end
  end
end
