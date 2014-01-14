class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :type, default: 'Booking'
      t.datetime :start
      t.datetime :end
    end
  end
end
