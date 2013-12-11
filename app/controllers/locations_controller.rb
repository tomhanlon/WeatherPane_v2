class LocationsController < ApplicationController

  def index
  end

  def show
    controller_lat = params[:latitude]
    controller_long = params[:longitude]

    new1 = controller_lat.gsub('x', '.')
    new2 = controller_long.gsub('x', '.')

    if new2[0] == 'n'
      new2 = new2.gsub('n','-')
    elsif new1[0] =='n'
      new1 = new1.gsub('n','-')
    end

    response = Unirest.get("https://api.forecast.io/forecast/#{Figaro.env.STRIPE_API_KEY}/#{new1},#{new2}")
    @current_condition = response.body['currently']['icon']
    @current_temp = response.body['currently']['temperature']

    place = Unirest.get("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{new1},#{new2}&sensor=true")
    @current_city = place.body['results'][0]['address_components'][3]['long_name']
    @current_state = place.body['results'][0]['address_components'][5]['short_name']

  case @current_condition
      when 'rain'
        @icon = '/images/rain.jpg'
      when 'clear-day'
        @icon = '/images/clear-day.jpg'
      when 'clear-night'
        @icon = '/images/clear-night.jpg'
      when 'cloudy'
        @icon = '/images/cloudy.jpg'
      when 'fog'
        @icon = '/images/fog.jpg'
      when 'partly-cloudy-night'
        @icon = '/images/partly-cloudy-night.jpg'
      when 'partly-cloudy-day'
        @icon = '/images/partly-cloudy-day.jpg'
      when 'sleet'
        @icon = '/images/sleet.jpg'
      when 'snow'
        @icon = '/images/snow.jpg'
      when 'wind'
        @icon = '/images/wind.jpg'
      else
        @icon = '/images/wildbill.jpg'
      end
  
  end
end