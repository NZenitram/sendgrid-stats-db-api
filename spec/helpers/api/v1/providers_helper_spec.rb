require 'rails_helper'


RSpec.describe Api::V1::ProvidersHelper, type: :helper do
  context "parse_providers_json parses JSON to hash object" do
    before(:each) do
      prov_1 = build_list(:provider, 4, date: "2016-1-01")
      prov_2 = build_list(:provider, 4, date: "2016-1-02")
      prov_3 =  build_list(:provider, 4, date: "2016-1-03")
      prov_4 =build_list(:provider, 4, date: "2016-1-04")
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end
    it "takes JSON and returns Object" do
      providers = @providers.to_json
      array = Api::V1::ProvidersHelper.parse_providers_json(providers)
      single_provider = array.first
      
      expect(array.class).to be(Array)
      expect(single_provider.class).to be(Hash)
      expect(single_provider['date']).to eq("2016-1-01")
    end
  end
end
