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

    if params[:theme].blank?
      theme = "Select theme to leave your answer"
      data = { index: 0, name: 'радуга', file: 'raduga5обрез.jpg'}
      # logger.info "1 data = #{data.inspect} "
      image_data(theme, data)
     
    else
      theme = params[:theme]
      logger.info "2 theme = #{theme.inspect} "
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
      image_data(theme, data)
    end

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
                                      status: :successfully,
                                      notice: 'Successfully listed to previous'} }
      end
    end

  end



  # @note: this method should show image without diag
  #   then - start to calculate diag
  def results_list
    logger.info "In work#results_list "
    res_composite_diag = Image.all.order("ave_value DESC")#.descend
    logger.info " res_composite_diag.size = #{res_composite_diag.size}"
    @composite_results_size = res_composite_diag.size
    # @results = @res_diag.sort_by &:hk_light.descend
    @composite_results = res_composite_diag.take(@composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)
    # logger.info "In work_cntrl#results_list: @composite_results_paged = #{@composite_results_paged}"

    logger.info "In work_cntrl#results_list: @composite_results_size = #{@composite_results_size}"
    # respond_to do |format|
    #   # if new_image_index.blank?
    #     format.html {}
    #     format.js {} # render diag: @image_diag, status: :unprocessable_entity }
    #     # format.json { head :ok}
    #   # else
    #   #   format.html { render display_theme_path, status: :successfully }
    #   #   # format.js   { render "diag"=>@image_diag, status: :successfully   }
    #   #   format.json { render json:  { new_image_index: prev_image_data[:index],
    #   #                                 name: prev_image_data[:name],
    #   #                                 file: prev_image_data[:file],
    #   #                                 status: :successfully,
    #   #                                 notice: 'Successfully listed to previous'} }
    #   # end
    # end
    # respond_to :js

  end







end
