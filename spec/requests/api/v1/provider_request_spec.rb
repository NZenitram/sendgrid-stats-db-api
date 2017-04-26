require 'rails_helper'

describe "provider endpoint" do
  context "POST poviders" do
    before(:each) do
      prov_1 = build_list(:provider, 4, date: "2016-1-01")
      prov_2 = build_list(:provider, 4, date: "2016-1-02")
      prov_3 = build_list(:provider, 4, date: "2016-1-03")
      prov_4 = build_list(:provider, 4, date: "2016-1-04")
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end

    it "it POSTS providers to the database" do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', {providers: providers}

      expect(response).to be_success
      expect(response.code).to eq("204")
      expect(Provider.all.first.date).to eq(test_prov.date)
      expect(Provider.all.first.user_id).to eq(test_prov.user_id)
    end

    it "GET a user's providers from database" do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers, user_id: test_prov.user_id}

      get "/api/v1/providers/#{test_prov.user_id}"

      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(Provider.all.first.date).to eq(test_prov.date)
    end

    it 'GET all provider data from the DB' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers}

      get "/api/v1/providers"

      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(Provider.all.first.date).to eq(test_prov.date)

    end

    it 'GETs all provider names in an array from DB' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers}

      get "/api/v1/providers-names"
      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(data).to be_an_instance_of(Array)
      expect(data[0]).to eq("Gmail")
    end

    it 'GETs all data for a provider' do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', params: {providers: providers}

      get "/api/v1/providers-names/#{test_prov.provider_name}"
      data = JSON.parse(response.body)

      expect(response).to be_success
      expect(data).to be_an_instance_of(Array)
      expect(data[0]["utc_date"]).to eq(Provider.first["utc_date"])
    end
  end
end
