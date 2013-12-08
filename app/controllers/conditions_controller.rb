class ConditionsController < ApplicationController
  
  def index
  end

  def condition_query
		response = Unirest.get("https://api.forecast.io/forecast/89c4c48896b556b333f12c324914e8f1/30.2500,-97.7500")
	 	@current_condition = response.body['currently']['icon']
	 	@current_temp = response.body['currently']['temperature'] 

	 	case @current_condition
		 	when 'rain' then @icon = 'images/rain.jpg'
		 	when 'clear-day' then @icon = 'clear-day.jpg'
		 	when 'clear-night' then @icon = 'clear-night.jpg'
		 	when 'cloudy' then @icon = 'cloudy.jpg'
		 	when 'fog' then @icon = 'fog.jpg'
		 	when 'partly-cloudy-night' then @icon = 'partly-cloudly-night.jpg'
		 	when 'partly-cloudy-day' then @icon = 'partly-cloudy-day.jpg'
		 	when 'sleet' then @icon = 'sleet.jpg'
		 	when 'snow' then @icon = 'snow.jpg'
		 	when 'wind' then @icon = 'wind.jpg'
		 	else
	 	end 
	end	
end