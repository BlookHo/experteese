class Value < ApplicationRecord
  
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
