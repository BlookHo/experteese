class MainController < ApplicationController
  require 'json'
  
  
  
  def index
  
    @tasks = "fsdfsdf"
    respond_to  :json, :html
  
    # respond_to do |format|
    #   format.html
    #   format.json
    # end

  end
end
