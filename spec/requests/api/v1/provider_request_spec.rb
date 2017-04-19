require 'rails_helper'

describe "provider endpoint" do
  before(:each) do
    build_list(:provider, 4, date: "2016-1-01")
    build_list(:provider, 4, date: "2016-1-02")
    build_list(:provider, 4, date: "2016-1-03")
    build_list(:provider, 4, date: "2016-1-04")
  end

  context "POST poviders" do
    before(:each) do
      post '/api/v1/providers', {providers: Provider.all.to_json}
    end
    it "it receives reponse 204" do

      expect(response).to be_success
      expect(response.code).to eq("204")
    end

    it "it saves users to the DB" do
      binding.pry
    end
  end
end
