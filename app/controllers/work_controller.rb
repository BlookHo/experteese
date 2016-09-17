class WorkController < ApplicationController
  
  
  def index
  
    @images_count = Image.all.count
    @images = Image.all
    logger.info  "@images_count = #{@images_count}"
    logger.info  "@images.size = #{@images.size}"
    logger.info  "@images[2] = #{@images[2].inspect}"

  end
end
