class Providers < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :date
      t.string :provider_name
      t.integer :blocks
      t.integer :bounces
      t.integer :clicks
      t.integer :deferred
      t.integer :delivered
      t.integer :drops
      t.integer :opens
      t.integer :spam_reports
      t.integer :unique_clicks
      t.integer :unique_opens
    end
  end
end
