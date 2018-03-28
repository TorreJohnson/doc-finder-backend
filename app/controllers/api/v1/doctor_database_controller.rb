class Api::V1::DoctorDatabaseController < ApplicationController
  before_action :set_api_params

  def doctors
    if params[:q] != ''
      @doctors = RestClient.get("#{@base_url}/doctors?query=#{params[:q]}&location=#{params[:latitude]}%2C#{params[:longitude]}%2C10&user_location=#{params[:latitude]}%2C#{params[:longitude]}&sort=distance-asc&skip=0&limit=15&user_key=#{@api_key}")
    else
      @doctors = RestClient.get("#{@base_url}/doctors?location=#{params[:latitude]}%2C#{params[:longitude]}%2C10&user_location=#{params[:latitude]}%2C#{params[:longitude]}&sort=distance-asc&skip=0&limit=15&user_key=#{@api_key}")
    end
    render json: @doctors
  end

  def insurances
    @insurances = RestClient.get("#{@base_url}/insurances?user_key=#{@api_key}")
    render json: @insurances
  end

  private

  def set_api_params
    @api_key = ENV["better_doctors_api_key"]
    @base_url = "https://api.betterdoctor.com/2016-03-01"
  end

end
