require 'rails_helper'

describe "provider endpoint" do
  context "POST poviders" do
    before(:each) do
      prov_1 = build_list(:provider, 4, date: "2016-1-01")
      prov_2 = build_list(:provider, 4, date: "2016-1-02")
      prov_3 =  build_list(:provider, 4, date: "2016-1-03")
      prov_4 =build_list(:provider, 4, date: "2016-1-04")
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end

    it "it saves providers to the DB" do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', {providers: providers}

      expect(response).to be_success
      expect(response.code).to eq("204")
      expect(Provider.all.first.date).to eq(test_prov.date)
      expect(Provider.all.first.user_id).to eq(test_prov.user_id)
    end

    it "gets all providers from database" do
      providers = @providers.to_json
      test_prov = @providers.first
      post '/api/v1/providers', {providers: providers, user_id: test_prov.user_id}

      get "/api/v1/providers/#{test_prov.user_id}"
      expect(response).to be_success
      expect(response.code).to eq("200")
      expect(Provider.all.first.date).to eq(test_prov.date)
    end
  end
end
