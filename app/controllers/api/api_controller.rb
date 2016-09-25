module Api
  class ApiController < ApplicationController
    include WorkImage


    def next_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i
  
      new_image_index = next_index(current_index, length)
      next_image_data = show_image(theme_id, new_image_index)
      # logger.info "In next_image: current_index = #{current_index.inspect},
      #               new_image_index = #{new_image_index.inspect},
      #               next_image_data = #{next_image_data.inspect} "
  
      respond_to do |format|
        if new_image_index.blank?
          format.html {  render nothing: true, status: :unprocessable_entity }
          format.json {} # render diag: @image_diag, status: :unprocessable_entity }
        else
          format.html { render display_theme_path, status: :successfully }
          format.json { render json:  { new_image_index: next_image_data[:index],
                                        name: next_image_data[:name],
                                        file: next_image_data[:file],
                                        image_id: next_image_data[:image_id],
                                        user_valued: next_image_data[:user_valued],
                                        common_ave_value: next_image_data[:common_ave_value],
                                        value: next_image_data[:value],
                                        status: :successfully,
                                        notice: 'Successfully listed to next'} }
        end
      end


    end


    def prev_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i
  
      new_image_index = prev_index(current_index, length)
      prev_image_data = show_image(theme_id, new_image_index)
      # logger.info "In prev_image: current_index = #{current_index.inspect},
      #               new_image_index = #{new_image_index.inspect},
      #               prev_image_data = #{prev_image_data.inspect} "
  
      respond_to do |format|
        if new_image_index.blank?
          format.html {  render nothing: true, status: :unprocessable_entity }
          format.json {}
        else
          format.html { render display_theme_path, status: :successfully }
          # format.js   { render "diag"=>@image_diag, status: :successfully   }
          format.json { render json:  { new_image_index: prev_image_data[:index],
                                        name: prev_image_data[:name],
                                        file: prev_image_data[:file],
                                        image_id: prev_image_data[:image_id],
                                        user_valued: prev_image_data[:user_valued],
                                        common_ave_value: prev_image_data[:common_ave_value],
                                        value: prev_image_data[:value],
                                        status: :successfully,
                                        notice: 'Successfully listed to previous'} }
        end
      end

    end




    # @note: this method should save value diag for one image
    #   then - start to calculate average value
    def save_value
      image_id = params[:image_id].to_i
      theme_id = params[:theme_id].to_i
      value = params[:value].to_i
  
      logger.info "In save_value: image_id = #{image_id.inspect},
                  theme_id = #{theme_id.inspect},
                 value = #{value.inspect} "
  
      new_value_data = {
        user_id: current_user.id,
        image_id: image_id,
        value: value
      }
      logger.info "In save_value: new_value_data = #{new_value_data.inspect}"
  
      # save image value to   Values (user_id, image_id, value)
      Value.create(new_value_data)
  
      user_value = value
  
      # calc ave_value and save to Image (image_id, ave_value)
      ave_value = Value.calc_average_value(image_id).round
      logger.info "In save_value: after calc_average_value: ave_value = #{ave_value.inspect}"
  
      Image.update_ave_value(image_id, ave_value)
  
      valued_image_data = show_valued_image(theme_id, image_id)
  
      respond_to do |format|
        if value.blank?
          format.html {  render nothing: true, status: :unprocessable_entity }
          format.json {}
        else
          format.html { render display_theme_path, status: :successfully }
          format.json { render json:  {
            user_value: user_value,
            ave_value: ave_value,
            values_qty: valued_image_data[:values_qty],
            image_id: valued_image_data[:image_id],
            user_valued: valued_image_data[:user_valued],
            common_ave_value: valued_image_data[:common_ave_value],
            value: valued_image_data[:value],
            status: :successfully,
            notice: 'Successfully listed to previous'}
        
          }
        end
      end


    end




  end
  
  
end