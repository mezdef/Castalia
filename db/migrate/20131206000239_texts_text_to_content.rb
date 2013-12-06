class TextsTextToContent < ActiveRecord::Migration
  def change
    rename_column :texts, :text, :content
  end
end
