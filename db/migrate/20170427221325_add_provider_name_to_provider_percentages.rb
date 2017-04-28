class AddProviderNameToProviderPercentages < ActiveRecord::Migration[5.0]
  def change
    add_column :provider_percentages, :provider_name, :string
  end
end
