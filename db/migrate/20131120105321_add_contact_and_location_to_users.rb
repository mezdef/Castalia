class AddContactAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact, :string
    add_column :users, :location, :string
  end
end
