class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.boolean :presence
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
