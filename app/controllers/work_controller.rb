class WorkController < ApplicationController
  require 'json'
  
  
  def index
  
    @images_count = Image.all.count
    @images = Image.all
    logger.info  "@images_count = #{@images_count}"
    logger.info  "@images.size = #{@images.size}"
    logger.info  "@images[2] = #{@images[2].inspect}"
    @selected_theme = "Select theme to leave your answer"

  end

  # @note: use in views
  def choose_image
    logger.info "In WorkController#choose_image"
    folder = "app/assets/images/pictures/"
    @pictures_files = Dir.entries(folder) # массив имен файлов из указанной папки
  end

  # @note: use in views
  def choose_theme
    # folder = "app/assets/images/pictures/"
    @themes = Theme.all.pluck(:name)
    logger.info "In WorkController#choose_theme @themes = #{@themes}"
    # массив имен файлов из указанной папки
  end


  def display_theme
    logger.info "In work#display_theme"

    if params[:theme].blank?
      @selected_theme = "Select theme to leave your answer"
      logger.info  "In #display_image_result: Default set up @selected_theme = '#{@selected_theme}'"
    else
      theme = params[:theme]
      @selected_theme = theme
      
      theme_id = Theme.find_theme_id(theme)
      logger.info "theme = #{@selected_theme.inspect}, theme_id = #{theme_id} "

      @theme_images = Image.theme_images(theme_id)
      logger.info "@theme_images[0] = #{@theme_images[0].inspect} " unless @theme_images.blank?

      @first_theme_images = []
      @first_theme_images = @theme_images.first.attributes.to_json unless @theme_images.blank?
      logger.info "@first_theme_images = #{@first_theme_images.inspect} "
      # @first_theme_images_json = @first_theme_images.to_json
      # logger.info "4 @@first_theme_images_json = #{@first_theme_images_json.inspect} "


   
      
      
    end
  
      
  end

  
  

  end
