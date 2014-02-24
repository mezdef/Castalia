class StartFromDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :events, :start, :date
    change_column :events, :finish, :date
  end
end
