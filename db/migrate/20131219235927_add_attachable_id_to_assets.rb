class AddAttachableIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :attachable_id, :integer
  end
end
