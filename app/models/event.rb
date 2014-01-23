class Event < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  def type
    event_type
  end

  def length
    ((((finish - start)/60)/60)/24).to_i
  end

end
