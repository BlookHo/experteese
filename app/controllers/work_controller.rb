class WorkController < ApplicationController
  require 'json'
  include WorkImage
  
  def index
    @images_count = Image.all.count
    # logger.info  "@images_count = #{@images_count}"
    @selected_theme = "Select theme to leave your answer"
    @selected_image_name = 'радуга'
  end

  # # @note: use in views
  # def choose_image
  #   logger.info "In WorkController#choose_image"
  #   folder = "app/assets/images/pictures/"
  #   @pictures_files = Dir.entries(folder) # массив имен файлов из указанной папки
  # end

  # @note: use in views
  def choose_theme
    @themes = Theme.all.pluck(:name)
    logger.info "In WorkController#choose_theme @themes = #{@themes}"
    respond_to :js
  end

  # @note: first display_theme and show first image from image array
  def display_theme
    logger.info "In work#display_theme"
    @image_data = {}
    logger.info "1 theme = #{params[:theme].inspect} "

    current_user_id = current_user.id
    logger.info "2 current_user_id = #{current_user_id.inspect} "


    if params[:theme] == "-----" #.blank?
      theme = "Select theme to leave your answer"
      theme_id = 1
      data = { index: 0, name: 'радуга', file: 'raduga5обрез.jpg', image_id: 4, current_user_id: current_user_id}
      logger.info "1 data = #{data.inspect} "
    else
      theme = params[:theme]
      logger.info "2 theme = #{theme.inspect} "
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    logger.info "session[:selected_theme_id] = #{session[:selected_theme_id].inspect} "

    image_data(theme, data)
    
  end

  
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
        # format.js   { render "diag"=>@image_diag, status: :successfully   }
        format.json { render json:  { new_image_index: next_image_data[:index],
                                      name: next_image_data[:name],
                                      file: next_image_data[:file],
                                      image_id: next_image_data[:image_id],
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
        format.json {} # render diag: @image_diag, status: :unprocessable_entity }
      else
        format.html { render display_theme_path, status: :successfully }
        # format.js   { render "diag"=>@image_diag, status: :successfully   }
        format.json { render json:  { new_image_index: prev_image_data[:index],
                                      name: prev_image_data[:name],
                                      file: prev_image_data[:file],
                                      image_id: prev_image_data[:image_id],
                                      status: :successfully,
                                      notice: 'Successfully listed to previous'} }
      end
    end

  end



  # @note: this method should show image without diag
  #   then - start to calculate diag
  def results_list
    selected_theme_id = session[:selected_theme_id]
    logger.info "In work#results_list: selected_theme_id = #{selected_theme_id} "

    res_composite_diag = Image.where(theme_id: selected_theme_id).order("ave_value DESC")#.descend
    logger.info " res_composite_diag.size = #{res_composite_diag.size}"
    @composite_results_size = res_composite_diag.size
    # @results = @res_diag.sort_by &:hk_light.descend
    @composite_results = res_composite_diag.take(@composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)
    # logger.info "In work_cntrl#results_list: @composite_results_paged = #{@composite_results_paged}"

    logger.info "In work_cntrl#results_list: @composite_results_size = #{@composite_results_size}"
  
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
    
    ave_value = Value.calc_average_value(image_id)
    logger.info "In save_value: after calc_average_value: ave_value = #{ave_value.inspect}"

    Image.update_ave_value(image_id, ave_value)
    
    
    respond_to do |format|
      if value.blank?
        format.html {  render nothing: true, status: :unprocessable_entity }
        format.json {} # render diag: @image_diag, status: :unprocessable_entity }
      else
        format.html { render display_theme_path, status: :successfully }
        # format.js   { render "diag"=>@image_diag, status: :successfully   }
        format.json { render json:  {
                                      user_value: user_value,
                                      ave_value: ave_value,
                                      status: :successfully,
                                      notice: 'Successfully listed to previous'} }
      end
    end





  end


  # def calc_average_value(image_id)
  #
  #   values_arr = Value.where(image_id: image_id).pluck(:value)
  #
  #   values_sum = values_arr.inject(:+)
  #   ave_value = values_sum/values_arr.size
  #
  #   logger.info "In calc_average_value: ave_value = #{ave_value.inspect}"
  #
  # end





end
