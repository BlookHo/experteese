module WorkImage
  extend ActiveSupport::Concern

  include WorkHelper

   
  # display image by index for searched theme
  def show_image(theme_id, image_index)
    theme_images = Image.theme_images(theme_id)

    current_user_id = current_user.id
    logger.info "In show_image: current_user_id = #{current_user_id.inspect} "
    one_image_attr = theme_images[image_index].attributes
    image_id = one_image_attr["id"]

    user_valued = Value.user_valued_image(current_user_id, image_id).exists? # true/false
    logger.info "In show_image: user_valued = #{user_valued.inspect} "

    data = { index: image_index,
             current_user_id: current_user_id,
             theme_id: theme_id,
             images_arr_size: theme_images.size,
             image_id: image_id,
             name: one_image_attr["name"],
             file: one_image_attr["file"],
             user_valued: user_valued,
      }
    logger.info "In show_image:  data = #{data.inspect} "
  
    data
  end
  
  
  def next_index(index, length)
    new_index = index
    # logger.info "In next_index: new_index = #{new_index.inspect}, index = #{index.inspect}, length = #{length.inspect} "
    if index < length-1
      new_index += 1
    else
      new_index = 0
    end
    # logger.info "In next_index: new_index = #{new_index.inspect} "
    new_index
  end

  def prev_index(index, length)
    new_index = index
    if index > 0
      new_index -= 1
    else
      new_index = length-1
    end
    new_index
  end


 

end
