module Api::V1::ProvidersPercentagesHelper
  def self.parse_providers_json(providers)
    JSON.parse(providers, symbolize_headers: true)
  end

  def self.save_providers_percentages_to_database(providers)
    providers = self.parse_providers_json(providers)
    providers.each do |provider|
      data = {}
      data["provider_name"] = Provider.new.fix_provider_names(provider["provider_name"])
      data["utc_date"] = Provider.new.convert_date_time(provider["date"])
      data["open_percentage"] = (provider["opens"].to_f / provider["delivered"].to_f).round(2)
      data["click_percentage"] = (provider["clicks"].to_f / provider["delivered"].to_f).round(2)
      data["spam_report_percentage"] = (provider["spam_reports"].to_f / provider["delivered"].to_f).round(2)
      data["date"] = provider["date"]
      data["user_id"] = provider["user_id"]
      ProviderPercentage.find_or_create_by(data)
    end
  end
end
