module WorkImage
  extend ActiveSupport::Concern

  include WorkHelper

   
  # display image by index for searched theme
  def show_image(theme_id, image_index)
    theme_images = Image.theme_images(theme_id)

    current_user_id = current_user.id
    logger.info "In show_image: current_user_id = #{current_user_id.inspect} "
    
    one_image_attr = theme_images[image_index].attributes
    logger.info "In show_image: one_image_attr = #{one_image_attr.inspect} "
    image_id = one_image_attr["id"]
    logger.info "In show_image: image_id = #{image_id.inspect} "

    user_valued, value = Value.user_valued_exists(current_user_id, image_id) # 1/0 # true/false .exists?
    logger.info "In show_image: user_valued = #{user_valued.inspect} "

    values_qty = Value.all.count.round

    if user_valued == 1
      common_ave_value = Image.find_image(image_id).ave_value
      logger.info "In 1show_image: common_ave_value = #{common_ave_value.inspect} "
      if common_ave_value.blank?
        common_ave_value = 0
      end
      common_ave_value.round unless common_ave_value.blank?
      logger.info "In 2show_image: common_ave_value = #{common_ave_value.inspect} "
    else
      common_ave_value = 0
    end

    data = { index: image_index,
             values_qty: values_qty,
             current_user_id: current_user_id,
             theme_id: theme_id,
             images_arr_size: theme_images.size,
             image_id: image_id,
             name: one_image_attr["name"],
             file: one_image_attr["file"],
             user_valued: user_valued,
             value: value,
             common_ave_value: common_ave_value
      }
    logger.info "In show_image:  data = #{data.inspect} "
    data
  end


  def next_index(index, length)
    new_index = index
    # if index < length-1
    #   new_index += 1
    # else
    #   new_index = 0
    # end
    index < length-1 ? new_index += 1 : new_index = 0
    new_index
  end

  
  def prev_index(index, length)
    new_index = index
    index > 0 ? new_index -= 1 : new_index = length-1
    new_index
  end

 

end
