class AddColumnOpensToGlobalStats < ActiveRecord::Migration[5.0]
  def change
    add_column :global_stats, :opens, :integer
  end
end
