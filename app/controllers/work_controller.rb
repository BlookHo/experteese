class WorkController < ApplicationController
  require 'json'
  include WorkImage
  
  def index
    @images_count = Image.all.count
    @selected_theme = "Select theme to leave your answer"
    @selected_image_name = 'радуга'
    @values_qty = Value.all.count
    session[:selected_theme_id] = @selected_theme
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
      data = { index: 0, name: 'радуга', file: 'raduga5обрез.jpg', image_id: 4,
               current_user_id: current_user_id, user_valued: false, common_ave_value: 0, value: 0 }
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

  
  # @note: this method should show image without diag
  #   then - start to calculate diag
  def results_list
    selected_theme_id = session[:selected_theme_id]
    logger.info "In work#results_list: selected_theme_id = #{selected_theme_id} "

    res_composite_diag = Image.where(theme_id: selected_theme_id).order("ave_value DESC")#.descend
    logger.info " res_composite_diag.size = #{res_composite_diag.size}"
    @composite_results_size = res_composite_diag.size
    @composite_results = res_composite_diag.take(@composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)

    logger.info "In work_cntrl#results_list: @composite_results_size = #{@composite_results_size}"
  end




end
