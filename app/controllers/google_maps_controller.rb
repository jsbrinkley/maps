require 'net/http'
require 'rubygems'
require 'json'
require 'active_support'
include GoogleMapsHelper

class GoogleMapsController < ApplicationController


  def index 
      @urlkey = get_url(params) 

      @jsonRoute = GoogleMaps.get_directions_json(params)

      #@status = GoogleMaps.get_json_status(@jsonRoute)
      
      #@coordinates = GoogleMaps.get_route_points(@jsonRoute) 
  
  end 

end
