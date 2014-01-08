class Asset < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true
  has_attached_file :asset, :default_url  => "/images/:style/missing.png"

  
  def url
    asset.url
  end
  
  def name
    asset_file_name
  end
  
  def content_type
    asset_content_type
  end
  
  def file_size
    asset_file_size
  end

end
