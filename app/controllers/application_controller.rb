class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper # to see in views and controllers

  # STEP 1
  # def index
  #   render html: "hello, world!"
  # end


  # Включение метода постраничного отображения в зависимости от класса
  # data - Array или AR
  # gem Kaminari
  # @param data [ActiveRecord Collection] записи из таблицы
  def pages_of(data, records_per_pages)
    unless data.kind_of?(Array)
      data.page(params[:page]).per(records_per_pages)
    else
      Kaminari.paginate_array(data).page(params[:page]).per(records_per_pages)
    end
  end



end
