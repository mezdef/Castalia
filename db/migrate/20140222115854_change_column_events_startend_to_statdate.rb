class ChangeColumnEventsStartendToStatdate < ActiveRecord::Migration
  def change
    rename_column :events, :start, :start_date
    rename_column :events, :finish, :finish_date
  end
end
