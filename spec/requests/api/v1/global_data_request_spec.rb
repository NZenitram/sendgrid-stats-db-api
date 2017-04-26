require 'rails_helper'

context 'global data endpoint' do
  context 'POST global data' do
    before(:each) do
      global_1 = build_list(:global_stat, 4, date: "2016-1-01")
      global_2 = build_list(:global_stat, 4, date: "2016-1-02")
      global_3 =  build_list(:global_stat, 4, date: "2016-1-03")
      global_4 =build_list(:global_stat, 4, date: "2016-1-04")
      @globals = [global_1, global_2, global_3, global_4].flatten
    end
    it "it POSTS global_stats to the database" do
      globals = @globals.to_json
      test_global = @globals.first
      post '/api/v1/global-stats', {globals: globals}

      expect(response).to be_success
      expect(response.code).to eq("204")
      expect(GlobalStat.all.first.date).to eq(test_global.date)
      expect(GlobalStat.all.first.user_id).to eq(test_global.user_id)
    end
  end
end
