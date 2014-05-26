require 'sintra'
require 'net/http'

get "/:lat/:lon" do
  params[:lat] + ' and ' + params[:lon]

  # uri = URI::HTTP.build(
  #   host: '..forecast.io',
  #   path: '/forecast',
  #   query: '..'
  # )

  # content_type 'application/json', charset: 'utf-8'
  #
  # Net::HTTP.get(uri)
end
