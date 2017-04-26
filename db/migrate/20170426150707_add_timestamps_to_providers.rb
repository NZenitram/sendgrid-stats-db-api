class AddTimestampsToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :created_at, :datetime, null: false
    add_column :providers, :updated_at, :datetime, null: false
  end
end
