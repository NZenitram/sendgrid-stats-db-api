require 'rails_helper'

describe 'top-five providers endpoint' do
  context 'returns the top-five providers' do
    before(:each) do
      prov_1 = build_list(:provider, 7, date: "2016-1-01")
      prov_2 = build_list(:provider, 7, date: "2016-1-02")
      prov_3 = build_list(:provider, 7, date: "2016-1-03")
      prov_4 = build_list(:provider, 7, date: "2016-1-04")
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end
    it 'it returns the top-five providers by processed' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', {providers: providers}

      get '/api/v1/top-five'

      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end
end
