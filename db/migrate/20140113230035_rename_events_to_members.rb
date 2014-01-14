class RenameEventsToMembers < ActiveRecord::Migration
  def change
    rename_column :users, :event_id, :member_id
    rename_column :users, :event_type, :member_type
  end
end
