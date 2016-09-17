class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper # to see in views and controllers

  # STEP 1
  # def index
  #   render html: "hello, world!"
  # end
  
end
