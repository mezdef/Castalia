class AddDocumentationToText < ActiveRecord::Migration
  def change
    add_attachment :texts, :documentation
  end
end
