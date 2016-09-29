class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale


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


  def extr_locale_in_accept_lang
    # locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    # locale = request.env['HTTP_ACCEPT_LANGUAGE']#.scan(/^[a-z]{2}/).first

    # locale = request.env['Request URL']#.scan(/^[a-z]{2}/).first
    locale = params[:locale]#.scan(/^[a-z]{2}/).first

    logger.info "In extr_locale_in_accept_lang: locale = #{locale}"
  end


  private
  

  def set_locale_from_params
            
    if params[:locale]
  
      extr_locale_in_accept_lang
      
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
        # flash.now[:notice] = " #{params[:locale]} Есть Перевод страницы"
        logger.info flash.now[:notice]
      else
        flash.now[:alarm] = " #{params[:locale]} Перевод страницы отсутствует"
        logger.error flash.now[:alarm]
      end
      params[:locale]
    end
  end

  # 1-st ver
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  def set_locale
    I18n.locale = set_locale_from_params || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
  
  
end
