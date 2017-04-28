class ProviderPercentages < ActiveRecord::Migration[5.0]
  def change
    create_table :provider_percentages do |t|
      t.string :date
      t.float :open_percentage
      t.float :click_percentage
      t.float :spam_report_percentage
      t.float :unsubscribe_percentage
      t.integer :utc_date, :int8, :limit => 8
      t.integer :user_id

      t.timestamps
    end
  end
end
