class ConditionsController < ApplicationController

  def index
    response = Unirest.get("https://api.forecast.io/forecast/89c4c48896b556b333f12c324914e8f1/30.2500,-97.7500")
    @current_condition = response.body['currently']['icon']
    @current_temp = response.body['currently']['temperature'] 

    case @current_condition
      when 'rain'
      	@icon = 'images/rain.jpg'
      when 'clear-day'
      	@icon = 'images/clear-day.jpg'
      when 'clear-night'
      	@icon = 'images/clear-night.jpg'
      when 'cloudy'
       	@icon = 'images/cloudy.jpg'
      when 'fog'
       	@icon = 'images/fog.jpg'
      when 'partly-cloudy-night'
       	@icon = 'images/partly-cloudly-night.jpg'
      when 'partly-cloudy-day'
       	@icon = 'images/partly-cloudy-day.jpg'
      when 'sleet'
       	@icon = 'images/sleet.jpg'
      when 'snow'
       	@icon = 'images/snow.jpg'
      when 'wind'
       	@icon = 'images/wind.jpg'
      else
    end
  end
end