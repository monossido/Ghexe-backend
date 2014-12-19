class RenameFistNameToRistName < ActiveRecord::Migration
  def change
    rename_column :users, :fist_name, :first_name
    rename_column :admins, :fist_name, :first_name
  end
end
