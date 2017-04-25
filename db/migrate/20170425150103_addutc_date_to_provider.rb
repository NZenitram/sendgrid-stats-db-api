class AddutcDateToProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :utc_date, :int8, :limit => 8
  end
end
