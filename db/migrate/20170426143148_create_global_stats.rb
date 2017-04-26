class CreateGlobalStats < ActiveRecord::Migration[5.0]
  def change
    create_table :global_stats do |t|
      t.string :date
      t.integer :blocks
      t.integer :bounce_drops
      t.integer :bounces
      t.integer :clicks
      t.integer :deferred
      t.integer :delivered
      t.integer :invalid_emails
      t.integer :opensprocessed
      t.integer :requests
      t.integer :spam_report_drops
      t.integer :spam_reports
      t.integer :unique_clicks
      t.integer :unique_opens
      t.integer :unsubscribe_drops
      t.integer :unsubscribes
      t.integer :utc_date, :int8, :limit => 8
      t.integer :user_id

      t.timestamps
    end
  end
end
