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

    it "it receives reponse 204" do
      post '/api/v1/providers'

      expect(response).to be_success
      expect(response.code).to eq("204")
    end

    it "it saves users to the DB" do
      providers = @providers.to_json
      post '/api/v1/providers', {providers: providers}

    end
  end
end
