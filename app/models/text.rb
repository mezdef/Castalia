class Text < ActiveRecord::Base

  has_many :assets, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :assets

end
