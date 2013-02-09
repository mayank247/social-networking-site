class AddDeviseColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :null => false, :default => ""
    add_column :users, :gender, :string, :null => false, :default => ""
    add_column :users, :dob, :date, :null => false, :default => ""
  end
end
