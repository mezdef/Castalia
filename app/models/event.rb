class Event < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, length: { minimum: 4 }
  validates :length, numericality: { greater_than: 0, message: "of Event must be at least 1 day" }

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
    ((Time.parse(finish_date.strftime) - Time.parse(start_date.strftime)) / 60 / 60 / 24).to_i
  end

end
