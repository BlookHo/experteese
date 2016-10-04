class Value < ApplicationRecord
  belongs_to :user
  
  # todo: validations
  # t.integer  "user_id"
  # t.integer  "image_id"
  # t.integer  "value"
  # validates :name, presence: true, uniqueness: true, length: { maximum: 50 }


  # scope :theme_images, -> (theme_id) { select('id','name','file','ave_value').where(theme_id: theme_id) }
  scope :user_valued_image, -> (current_user_id, image_id) { where(user_id: current_user_id, image_id: image_id) }

  # calc ave_value
  def self.calc_average_value(image_id)
    values_arr = self.where(image_id: image_id).pluck(:value)
    values_sum = values_arr.inject(:+)
    ave_value = values_sum/values_arr.size
    logger.info "In calc_average_value: values_arr = #{values_arr.inspect}, values_sum = #{values_sum.inspect}, ave_value = #{ave_value.inspect}"
    ave_value.round
  end

  
  def self.user_valued_exists(current_user_id, image_id)
    value_image = user_valued_image(current_user_id, image_id)
    if value_image.blank?
      rez = 0
      value = 0
    else
      rez = 1
      value = value_image[0].value
    end
    return rez, value
  end
  
  


end
