class AddAttachableTypeToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :attachable_type, :string
  end
end
