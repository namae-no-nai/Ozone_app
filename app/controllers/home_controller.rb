class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=EBB3CF3E-148E-4BD0-AC82-EEE04E360BE0"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
        @final_output = "Error"
    elsif !@output
       @final_output = "Error"
    else @output
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "silver"
    elsif @final_output <= 50
      @api_color = "green"
      @api_descripition = "Good"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_descripition = "Acceptable"
    elsif @final_output <= 101 && @final_output <= 150
      @api_color = "orange"
      @api_descripition = "Moderate"
    elsif @final_output <= 151 && @final_output <= 200
      @api_color = "red"
      @api_descripition = "Unhealthy for Sensitive Groups"
    elsif @final_output <= 201 && @final_output <= 300
      @api_color = "purple"
      @api_descripition = "Unhealthy"
    elsif @final_output <= 301
      @api_color = "maroon"
      @api_descripition = "Very Unhealthy"
    end

    def zipcode
      @zip_query = params[:zipcode] 
      if params[:zipcode] == ""
        @zip_query = "zipcode missing"
      else
        @url = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=" + @zip_query.to_s + "&distance=0&API_KEY=EBB3CF3E-148E-4BD0-AC82-EEE04E360BE0"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
        @final_output = "Error"
    elsif !@output
       @final_output = "Error"
    else @output
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "silver"
    elsif @final_output <= 50
      @api_color = "green"
      @api_descripition = "Good"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_descripition = "Acceptable"
    elsif @final_output <= 101 && @final_output <= 150
      @api_color = "orange"
      @api_descripition = "Moderate"
    elsif @final_output <= 151 && @final_output <= 200
      @api_color = "red"
      @api_descripition = "Unhealthy for Sensitive Groups"
    elsif @final_output <= 201 && @final_output <= 300
      @api_color = "purple"
      @api_descripition = "Unhealthy"
    elsif @final_output <= 301
      @api_color = "maroon"
      @api_descripition = "Very Unhealthy"
    end

      end
    end
  end
end
