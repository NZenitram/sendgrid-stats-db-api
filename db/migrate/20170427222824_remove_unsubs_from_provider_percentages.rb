class RemoveUnsubsFromProviderPercentages < ActiveRecord::Migration[5.0]
  def change
    remove_column :provider_percentages, :unsubscribe_percentage
  end
end
