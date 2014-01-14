class AddGuestsIdAndTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :event_id, :integer
    add_column :users, :event_type, :string
  end
end
