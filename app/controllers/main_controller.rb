class MainController < ApplicationController
  require 'json'
  
  
  
  def index
  
    # @tasks = "index"
    # respond_to  :json, :html
  
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

  def test
    @current_user = current_user
  end

  def task_one
    @task_data = "current_user"
    logger.info "In task_one: @task_data = #{@task_data.inspect}"

  end

  # wheather_params = ActionController::Parameters.new
  # ActionController::Parameters.permit_all_parameters = true

  # params = ActionController::Parameters.new({
  #                                               cond_wheather: {
  #                                                   date: 'Francesco',
  #                                                   age:  22,
  #                                                   role: 'admin'
  #                                               }
  #                                           })



  def task_one_view
    @task_data = "current_user task_one_view"
    logger.info "In task_one_view: @task_data = #{@task_data.inspect}"
    # logger.info "In task_one_view: wheather_params = #{wheather_params.inspect}"

    cond_wheather = params[:cond_wheather]

    logger.info "In task_one_view: cond_wheather = #{cond_wheather.inspect}"


    @composite_results = []


    # new_image_index = next_index(current_index, length)
    # next_image_data = show_image(theme_id, new_image_index)
    # logger.info "In next_image: current_index = #{current_index.inspect},
    #               new_image_index = #{new_image_index.inspect},
    #               next_image_data = #{next_image_data.inspect} "


    # respond_to do |format|
    #   if cond_wheather.blank?
    #     format.html { render 'task_one_view', status: :unprocessable_entity }
    #     format.json { render json:  { status: :unsuccessfully} }
    #   else
    #     format.html { render 'task_one_view', status: :successfully }
    #     format.json { render json:  { status: :successfully} }
    #
    #     # format.json { render json:  { new_image_index: next_image_data[:index],
    #     #                               name: next_image_data[:name],
    #     #                               file: next_image_data[:file],
    #     #                               image_id: next_image_data[:image_id],
    #     #                               user_valued: next_image_data[:user_valued],
    #     #                               common_ave_value: next_image_data[:common_ave_value],
    #     #                               value: next_image_data[:value],
    #     #                               status: :successfully,
    #     #                               notice: 'Successfully listed to next'} }
    #   end
    # end

    # respond_to do |format|
    #   if cond_wheather
    #     flash.now[:notice] = "Welcome to the Experteese - sample App!"
    #     format.html { } #redirect_to '/display_wheather', notice: 'User was successfully created.' }
    #     # format.json { } #render json: { status: :successfully}}
    #   else
    #     flash.now[:alert] = "Bad registration"
    #     format.html { } #redirect_to '/display_wheather', notice: 'User was successfully created.' }
    #     # format.json { render json:  { status: :unsuccessfully}  }
    #   end
    # end

    render 'display_wheather'
    # display_wheather
  end


  def display_wheather

    @composite_results = []


  end



  private

  def wheather_params
    params.require(:cond_wheather).permit(:date, :day, :high, :low, :text)
  end



end

{
    "query": {
        "count": 1,
        "created": "2016-11-22T09:09:39Z",
        "lang": "ru-RU",
        "results": {
            "channel": {
                "units": {
                    "distance": "mi",
                    "pressure": "in",
                    "speed": "mph",
                    "temperature": "F"
                },
                "title": "Yahoo! Weather - Nome, AK, US",
                "link": "http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/",
                "description": "Yahoo! Weather for Nome, AK, US",
                "language": "en-us",
                "lastBuildDate": "Tue, 22 Nov 2016 12:09 AM AKST",
                "ttl": "60",
                "location": {
                    "city": "Nome",
                    "country": "United States",
                    "region": " AK"
                },
                "wind": {
                    "chill": "-6",
                    "direction": "45",
                    "speed": "14"
                },
                "atmosphere": {
                    "humidity": "77",
                    "pressure": "1006.0",
                    "rising": "0",
                    "visibility": "16.1"
                },
                "astronomy": {
                    "sunrise": "11:0 am",
                    "sunset": "4:35 pm"
                },
                "image": {
                    "title": "Yahoo! Weather",
                    "width": "142",
                    "height": "18",
                    "link": "http://weather.yahoo.com",
                    "url": "http://l.yimg.com/a/i/brand/purplelogo//uh/us/news-wea.gif"
                },
                "item": {
                    "title": "Conditions for Nome, AK, US at 11:00 PM AKST",
                    "lat": "64.499474",
                    "long": "-165.405792",
                    "link": "http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/",
                    "pubDate": "Mon, 21 Nov 2016 11:00 PM AKST",
                    "condition": {
                        "code": "29",
                        "date": "Mon, 21 Nov 2016 11:00 PM AKST",
                        "temp": "8",
                        "text": "Partly Cloudy"
                    },
                    "forecast": [
                        {
                            "code": "30",
                            "date": "22 Nov 2016",
                            "day": "Tue",
                            "high": "11",
                            "low": "2",
                            "text": "Partly Cloudy"
                        },
                        {
                            "code": "30",
                            "date": "23 Nov 2016",
                            "day": "Wed",
                            "high": "6",
                            "low": "1",
                            "text": "Partly Cloudy"
                        },
                        {
                            "code": "28",
                            "date": "24 Nov 2016",
                            "day": "Thu",
                            "high": "15",
                            "low": "3",
                            "text": "Mostly Cloudy"
                        },
                        {
                            "code": "26",
                            "date": "25 Nov 2016",
                            "day": "Fri",
                            "high": "11",
                            "low": "7",
                            "text": "Cloudy"
                        },
                        {
                            "code": "28",
                            "date": "26 Nov 2016",
                            "day": "Sat",
                            "high": "7",
                            "low": "3",
                            "text": "Mostly Cloudy"
                        },
                        {
                            "code": "28",
                            "date": "27 Nov 2016",
                            "day": "Sun",
                            "high": "6",
                            "low": "4",
                            "text": "Mostly Cloudy"
                        },
                        {
                            "code": "30",
                            "date": "28 Nov 2016",
                            "day": "Mon",
                            "high": "8",
                            "low": "2",
                            "text": "Partly Cloudy"
                        },
                        {
                            "code": "26",
                            "date": "29 Nov 2016",
                            "day": "Tue",
                            "high": "11",
                            "low": "8",
                            "text": "Cloudy"
                        },
                        {
                            "code": "30",
                            "date": "30 Nov 2016",
                            "day": "Wed",
                            "high": "11",
                            "low": "5",
                            "text": "Partly Cloudy"
                        },
                        {
                            "code": "26",
                            "date": "01 Dec 2016",
                            "day": "Thu",
                            "high": "14",
                            "low": "11",
                            "text": "Cloudy"
                        }
                    ],
                    "description": "<![CDATA[<img src=\"http://l.yimg.com/a/i/us/we/52/29.gif\"/>\n<BR />\n<b>Current Conditions:</b>\n<BR />Partly Cloudy\n<BR />\n<BR />\n<b>Forecast:</b>\n<BR /> Tue - Partly Cloudy. High: 11Low: 2\n<BR /> Wed - Partly Cloudy. High: 6Low: 1\n<BR /> Thu - Mostly Cloudy. High: 15Low: 3\n<BR /> Fri - Cloudy. High: 11Low: 7\n<BR /> Sat - Mostly Cloudy. High: 7Low: 3\n<BR />\n<BR />\n<a href=\"http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-2460286/\">Full Forecast at Yahoo! Weather</a>\n<BR />\n<BR />\n(provided by <a href=\"http://www.weather.com\" >The Weather Channel</a>)\n<BR />\n]]>",
                    "guid": {
                        "isPermaLink": "false"
                    }
                }
            }
        }
    }
}
