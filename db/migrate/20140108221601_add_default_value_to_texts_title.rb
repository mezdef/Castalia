class AddDefaultValueToTextsTitle < ActiveRecord::Migration
  def change
    change_column :texts, :title, :string, :default => "New About Section"
    remove_column :texts, :document_file_name
    remove_column :texts, :document_content_type
    remove_column :texts, :document_file_size
    remove_column :texts, :document_updated_at
  end
end
