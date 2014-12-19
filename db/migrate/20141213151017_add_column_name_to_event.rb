class AddColumnNameToEvent < ActiveRecord::Migration
  def change
    add_column :events, :dayofweek, :integer
  end
end
