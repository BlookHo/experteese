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
    logger.info "In test"

    @json = {"forecast": [
        {
            "code": "30",
            "date": "22 Nov 2016",
            "day": "Tue",
            "high": "11",
            "low": "2",
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
    }
    logger.info "In test: @json = #{@json.inspect}"
  end

  def task_one
    # @result = HTTParty.post('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'.to_str,
    #                         :body => @jsonParams.to_json,
    #                         :headers => { 'Content-Type' => 'application/json',
    #                                       'Api-Access-Key' => 'xxxxxxxx',
    #                                       'Transaction-Hash' => xxxx } )
    logger.info "In task_one: task_one_data"
  end


  def display_wheather

    obj = ActiveSupport::JSON.decode(params[:cond_wheather])
    logger.info "In display_wheather"
    @cond_wheather = obj['query']['results']['channel']['item']['forecast']
    logger.info "In display_wheather: obj = #{obj.inspect}, @cond_wheather = #{@cond_wheather.inspect}"




    logger.info "In display_wheather: @composite_results = #{@composite_results.inspect}"

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
