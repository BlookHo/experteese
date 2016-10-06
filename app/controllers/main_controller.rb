class MainController < ApplicationController
  require 'json'
  
  
  
  def index
  
    @tasks = "index"
    respond_to  :json, :html
  
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end


  def help
    @current_user = current_user
  end

  def contacts
    @current_user = current_user
  end
  
  def about
    @current_user = current_user
  end

end
