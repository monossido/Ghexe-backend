class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :dayofweek
      t.time :time

      t.timestamps
    end
  end
end
