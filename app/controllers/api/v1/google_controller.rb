class Api::V1::GoogleController < ApplicationController
  require 'JSON'

  def create
    api_key = ENV["google_maps_api_key"]
    location = params["location"].split(' ').join('+')
    @result = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{api_key}")
    @json = JSON.parse(@result)
    if @json["status"] == "OK"
      @coordinates = @json["results"][0]["geometry"]["location"]
      render json: @coordinates
    else
      render json: {"error": "location not found"}
    end

  end

end
