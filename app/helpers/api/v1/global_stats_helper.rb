module Api::V1::GlobalStatsHelper
  def self.parse_global_stats_json(global)
    JSON.parse(global, symbolize_headers: true)
  end

  def self.save_providers_to_database(global)
    global = self.parse_global_stats_json(global)
    global.each do |global|
      utc = GlobalStat.new.convert_date_time(global["date"])
      global["utc_date"] = utc
      GlobalStat.create(global)
    end
  end
end
