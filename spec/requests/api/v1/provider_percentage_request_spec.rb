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
      post '/api/v1/providers', params: {providers: providers}

      open_percentage = ((@providers.first.opens).to_f / (@providers.first.delivered).to_f).round(2)

      data = ProviderPercentage.first

      expect(data.open_percentage).to eq(open_percentage)
    end

    it 'GETs Provider Percentage Data' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers}

      get "/api/v1/provider-percentages/"

      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(ProviderPercentage.first.date).to eq(data.first["date"])
    end
    it "GET a user's providers from database" do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers, user_id: test_prov.user_id}

      get "/api/v1/provider-percentages/#{test_prov.user_id}"

      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(ProviderPercentage.first.date).to eq(data.first["date"])
    end
    it 'GETs all data for a provider and event' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers}

      get "/api/v1/provider-percentages/#{test_prov.provider_name}/open_percentage"
      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(data).to be_an_instance_of(Array)
      expect(data[0][0]).to eq(ProviderPercentage.first["utc_date"])
      expect(data[0][1]).to eq(ProviderPercentage.first["open_percentage"])
    end
  end
end
