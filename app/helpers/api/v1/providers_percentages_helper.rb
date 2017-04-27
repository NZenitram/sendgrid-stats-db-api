module Api::V1::ProvidersPercentagesHelper
  def self.parse_providers_json(providers)
    JSON.parse(providers, symbolize_headers: true)
  end

  def self.save_providers_percentages_to_database(providers)
    providers = self.parse_providers_json(providers)
    providers.each do |provider|
      name = Provider.new.fix_provider_names(provider["provider_name"])
      utc = Provider.new.convert_date_time(provider["date"])
      binding.pry
      provider["provider_name"] = name
      provider["utc_date"] = utc
      ProviderPercentage.find_or_create_by(provider)
    end
  end
end
