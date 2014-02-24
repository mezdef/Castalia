class Event < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  def type
    event_type
  end

  def start
    start_date
  end

  def finish
    finish_date
  end

  def length
    ((((finish_date.to_datetime - start_date.to_datetime)/60)/60)/24).to_i
  end

end
