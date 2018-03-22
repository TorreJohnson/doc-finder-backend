class Api::V1::DoctorDatabaseController < ApplicationController

  def index
    api_key = ENV["better_doctors_api_key"]
    latitude = params[:latitude]
    longitude = params[:longitude]
    @doctors = RestClient.get("https://api.betterdoctor.com/2016-03-01/doctors?location=#{longitude}%2C#{latitude}%2C5&user_location=#{longitude}%2C#{latitude}&skip=0&limit=10&user_key=#{api_key}")
    render json: @doctors
  end

end
