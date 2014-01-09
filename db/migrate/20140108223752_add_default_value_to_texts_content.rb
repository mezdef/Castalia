class AddDefaultValueToTextsContent < ActiveRecord::Migration
  def change
    change_column :texts, :content, :text, :default => "Section content area."
  end
end
