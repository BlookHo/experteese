class Value < ApplicationRecord
  
  
  # scope :theme_images, -> (theme_id) { select('id','name','file','ave_value').where(theme_id: theme_id) }
  scope :user_valued_image, -> (current_user_id, image_id) { where(user_id: current_user_id, image_id: image_id) }

  #
  # t.integer  "user_id"
  # t.integer  "image_id"
  # t.integer  "value"

  def self.calc_average_value(image_id)
    
    values_arr = self.where(image_id: image_id).pluck(:value)
    
    values_sum = values_arr.inject(:+)
    ave_value = values_sum/values_arr.size

    logger.info "In calc_average_value: values_arr = #{values_arr.inspect}, values_sum = #{values_sum.inspect}, ave_value = #{ave_value.inspect}"
    ave_value
  end


  
  


end
