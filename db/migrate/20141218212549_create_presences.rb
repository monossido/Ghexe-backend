class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :presence

      t.timestamps
    end
  end
end
