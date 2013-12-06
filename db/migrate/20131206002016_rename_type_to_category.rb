class RenameTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :texts, :type, :category
  end
end
