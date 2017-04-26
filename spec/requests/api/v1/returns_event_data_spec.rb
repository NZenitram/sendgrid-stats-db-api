require 'rails_helper'

describe 'provider event endpoints' do
  context 'it returns array formatted event data' do
    before(:each) do
      prov_1 = create_list(:provider, 4, date: "2016-1-01", utc_date: Provider.new.convert_date_time("2016-1-01") )
      prov_2 = create_list(:provider, 4, date: "2016-1-02", utc_date: Provider.new.convert_date_time("2016-1-02") )
      prov_3 = create_list(:provider, 4, date: "2016-1-03", utc_date: Provider.new.convert_date_time("2016-1-03"))
      prov_4 = create_list(:provider, 4, date: "2016-1-04", utc_date: Provider.new.convert_date_time("2016-1-04"))
      @providers = [prov_1, prov_2, prov_3, prov_4].flatten
    end

    it 'creates data with utc and delivered events' do
      providers = @providers.to_json
      test_prov = @providers.first

      get "/api/v1/provider-delivered/#{test_prov.provider_name}/delivered"
      data = JSON.parse(response.body)

      expect(data[0]).to be_an_instance_of(Array)
      expect(data[0][0]).to eq(test_prov["utc_date"])
      expect(data[0][1]).to eq(test_prov["delivered"])
    end
  end
end
