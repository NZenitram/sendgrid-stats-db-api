class RemoveInt8FromProviderPercentages < ActiveRecord::Migration[5.0]
  def change
    remove_column :provider_percentages, :int8
  end
end
