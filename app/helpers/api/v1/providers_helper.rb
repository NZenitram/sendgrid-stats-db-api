module Api::V1::ProvidersHelper
  def self.parse_providers_json(providers)
    JSON.parse(providers, symbolize_headers: true)
  end

  def self.save_providers_to_database(providers)
    providers = self.parse_providers_json(providers)
    providers.each do |provider|
      utc = Provider.new.convert_date_time(provider["date"])
      provider["utc_date"] = utc
      Provider.create(provider)
    end
  end
end
