require 'sinatra'
require 'sinatra/jsonp'
require 'rest_client'
require 'json'

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

BASE_URI = "https://api.forecast.io/forecast/#{ENV['FORECAST_IO_KEY']}/"

get "/:lat_lon" do
  content_type 'application/json', charset: 'utf-8'
  response = JSON.parse(RestClient.get(BASE_URI + params[:lat_lon]))

  JSONP({ temperature: response['currently']['temperature'],
          conditions: response['currently']['icon'] })
end
