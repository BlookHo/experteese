class Image < ApplicationRecord
  belongs_to :theme

  # get images array of arrays by given theme_id
  scope :theme_images, -> (theme_id) { select('id','name','file','ave_value').where(theme_id: theme_id) }

  def self.update_ave_value(image_id, ave_value)
    image = find(image_id)
    image.update(ave_value: ave_value)
  end

  
  
end
