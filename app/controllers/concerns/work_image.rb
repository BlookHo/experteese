module WorkImage
  extend ActiveSupport::Concern

  include WorkHelper

   
  # display image by index for searched theme
  def show_image(theme_id, image_index)
    theme_images = Image.theme_images(theme_id)
    # logger.info "2 In show_image: theme_images[0] = #{theme_images[0].inspect} " unless theme_images.blank?
    one_image_attr = theme_images[image_index].attributes
    # logger.info "3 one_image_attr = #{one_image_attr.inspect} "
  
    data = { index: image_index,
             theme_id: theme_id,
             images_arr_size: theme_images.size,
             name: one_image_attr["name"],
             file: one_image_attr["file"] }
    logger.info "4 data = #{data.inspect} "
  
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
