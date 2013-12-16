class RenameDocumentationToDocument < ActiveRecord::Migration
  def change
    rename_column :texts, :documentation_file_name, :document_file_name
    rename_column :texts, :documentation_content_type, :document_content_type
    rename_column :texts, :documentation_file_size, :document_file_size
    rename_column :texts, :documentation_updated_at, :document_updated_at
  end
end
