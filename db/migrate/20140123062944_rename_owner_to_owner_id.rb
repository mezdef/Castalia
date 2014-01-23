class RenameOwnerToOwnerId < ActiveRecord::Migration
  def change
    rename_column :events, :owner, :owner_id
  end
end
