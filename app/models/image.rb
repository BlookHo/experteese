class Image < ApplicationRecord
  belongs_to :theme

  # todo: validations
  # t.integer  "user_id"
  # t.integer  "image_id"
  # t.integer  "value"
  # validates :name, presence: true, uniqueness: true, length: { maximum: 50 }


  # get images array of arrays by given theme_id
  scope :theme_images, -> (theme_id) { select('id','name','file','ave_value').where(theme_id: theme_id) }

  def self.update_ave_value(image_id, ave_value)
    image = find(image_id)
    image.update(ave_value: ave_value)
  end

  
  
end
