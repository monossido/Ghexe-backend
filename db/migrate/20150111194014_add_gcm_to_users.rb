#encoding: utf-8
class AddGcmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gcm, :string
  end
end
