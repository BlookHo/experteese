class WorkController < ApplicationController
  
  
  def index
  
    @images_count = Image.all.count
    @images = Image.all
    logger.info  "@images_count = #{@images_count}"
    logger.info  "@images.size = #{@images.size}"
    logger.info  "@images[2] = #{@images[2].inspect}"

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



end
