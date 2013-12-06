class CreateAbout < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :title
      t.string :type
      t.text :text
    end
  end
end
