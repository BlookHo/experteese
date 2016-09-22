module WorkHelper
  
  
  #
  def image_data(theme, data)
    @image_data = {}
   
    @image_data[:theme] = theme
    @image_data[:theme_id] = data[:theme_id]
    @image_data[:index] = data[:index]
    @image_data[:images_arr_size]  = data[:images_arr_size]
    @image_data[:name]  = data[:name]
    @image_data[:file]  = data[:file]

    @image_data
  end
  
  
end
