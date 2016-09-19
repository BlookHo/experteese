class WorkController < ApplicationController
  require 'json'
  
  
  def index
    @images = Image.all
    @images_count = @images.count
    logger.info  "@images_count = #{@images_count}"
    # logger.info  "@images.size = #{@images.size}"
    # logger.info  "@images[2] = #{@images[2].inspect}"
    @selected_theme = "Select theme to leave your answer"
    @selected_image_name = 'радуга'
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
      # logger.info  "In #display_image_result: Default set up @selected_theme = '#{@selected_theme}'"
      # @selected_theme = ""

      @selected_image_name = 'радуга'
      # logger.info "2a @selected_image_name = #{@selected_image_name.inspect} "
      @first_theme_images_file = 'raduga5обрез.jpg'
      logger.info "2b @first_theme_images_file = #{@first_theme_images_file.inspect} "
    else
      theme = params[:theme]
      @selected_theme = theme
      # @selected_theme = ""
      theme_id = Theme.find_theme_id(theme)
      # logger.info "theme = #{@selected_theme.inspect}, theme_id = #{theme_id} "

      theme_images = Image.theme_images(theme_id)
      logger.info "theme_images[0] = #{theme_images[0].inspect} " unless theme_images.blank?

      first_theme_images = []
      first_theme_images = theme_images.first.attributes.to_json unless theme_images.blank?
      logger.info "first_theme_images = #{first_theme_images.inspect} "

      first_theme_images_attr = theme_images.first.attributes
      logger.info "4a first_theme_images_attr = #{first_theme_images_attr.inspect} "
      @selected_image_name = first_theme_images_attr["name"]
      logger.info "4b @selected_image_name = #{@selected_image_name.inspect} "
      @first_theme_images_file = first_theme_images_attr["file"]
      logger.info "4c @first_theme_images_file = #{@first_theme_images_file.inspect} "


   
      
      
    end
  
      
  end

  
  

  end
