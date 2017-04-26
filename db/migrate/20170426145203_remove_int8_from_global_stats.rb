class RemoveInt8FromGlobalStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :global_stats, :int8
  end
end
