WeatherPane::Application.routes.draw do
  root "locations#index"
  get '/locations/:latitude/:longitude' => "locations#show"

end