class Api::V1::GoogleController < ApplicationController
  require 'JSON'

  def create
    api_key = ENV["google_maps_api_key"]
    location = params["location"].split(' ').join('+')
    @result = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{api_key}")
    @json = JSON.parse(@result)
    @coordinates = @json["results"][0]["geometry"]["location"]
    render json: @coordinates
  end

end
