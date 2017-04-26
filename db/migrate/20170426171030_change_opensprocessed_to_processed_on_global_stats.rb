class ChangeOpensprocessedToProcessedOnGlobalStats < ActiveRecord::Migration[5.0]
  def change
    rename_column :global_stats, :opensprocessed, :processed
  end
end
