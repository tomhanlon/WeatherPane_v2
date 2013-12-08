WeatherPane::Application.routes.draw do
  root "conditions#index"
  get '/javascripturl/:latitude/:longitude' => "conditions#index"
end

