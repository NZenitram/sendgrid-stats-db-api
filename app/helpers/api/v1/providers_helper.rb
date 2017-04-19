module Api::V1::ProvidersHelper
  def self.parse_providers_json(providers)
    JSON.parse(providers, symbolize_headers: true)
  end

  def self.save_providers_to_database(providers)
    providers = self.parse_providers_json(providers)

    providers.each do |provider|
      Provider.create(provider)
    end
  end
end
