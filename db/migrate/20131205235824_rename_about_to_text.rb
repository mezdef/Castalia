class RenameAboutToText < ActiveRecord::Migration
  def change
    rename_table :abouts, :texts
  end
end
