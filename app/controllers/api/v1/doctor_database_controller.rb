class Api::V1::DoctorDatabaseController < ApplicationController
  before_action :set_api_key

  def doctors
    @doctors = RestClient.get("https://api.betterdoctor.com/2016-03-01/doctors?location=#{params[:latitude]}%2C#{params[:longitude]}%2C5&user_location=#{params[:latitude]}%2C#{params[:longitude]}&sort=distance-asc&skip=0&limit=10&user_key=#{@api_key}")
    render json: @doctors
  end

  def insurances
    @insurances = RestClient.get("https://api.betterdoctor.com/2016-03-01/insurances?user_key=#{@api_key}")
    render json: @insurances
  end

  private

  def set_api_key
    @api_key = ENV["better_doctors_api_key"]
  end

end
