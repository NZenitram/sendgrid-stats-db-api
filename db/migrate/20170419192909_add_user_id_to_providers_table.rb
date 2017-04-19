class AddUserIdToProvidersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :user_id, :integer
  end
end
