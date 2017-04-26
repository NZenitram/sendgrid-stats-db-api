class AddNullFalseToTimestampsAtProviders < ActiveRecord::Migration[5.0]
  def change
    change_column :providers, :created_at, :datetime, null: false
    change_column :providers, :updated_at, :datetime, null: false
  end
end
