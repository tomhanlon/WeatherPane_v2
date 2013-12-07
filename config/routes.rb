WeatherPane::Application.routes.draw do
get '/' => "conditions#index"
end
