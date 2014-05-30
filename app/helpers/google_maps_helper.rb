module GoogleMapsHelper

  @@key = "AIzaSyCS9C8uXjI5_qL5Z31gXj9Zsp5q1QuXpgM"

  # helper method to retrieve our uri string 
  def get_url(params)

    origin = ""
    destination = ""
=begin
    if(params[:origin] != nil)
      origin = params[:origin]
    end

    if(params[:destination] != nil)
      destination = params[:destination]
    else
      destination = origin
    end
=end 
    if(params[:origin] != nil && params[:destination]!= nil)
      origin=params[:origin]
      destination=params[:destination]
    elsif(params[:origin] != nil && params[:destination] ==nil)
      origin=params[:origin]
      destination=params[:origin]
    elsif(params[:origin] == nil && params[:destination] != nil)
      origin=params[:destination]
      destination=params[:destination]
    end
 
    url = "https://maps.googleapis.com/maps/api/directions/" +
          "json?sensor=false&origin=" + origin + 
          "&destination="+destination+"&key=" +@@key
   

      #replace spaces with underscores so that we can use it for the URI call
    url = url.gsub(' ','_')
  end

  # GET_JSON method to retrieve json from our google
  # directions api
  def get_json(url_param)

    uri = URI(url_param)
    http = Net::HTTP.new(uri.host, uri.port)
   
    # enable ssl on our http request, then verify before
    # using our get call 
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
  
    responseRoute = http.request(request)

    # this returns a rendered json from the body of our 
    # http request 
    jsonRoute = ActiveSupport::JSON.decode(responseRoute.body)
    jsonRoute.to_json
  end

  # will parse the string and retrieve the "status"
  def get_status(jsonRoute)
   
    jsonRoute = JSON.parse(jsonRoute) 
    # get our "status" key from the hash
    status = jsonRoute["status"]
   
    # determine what ERROR code to return depending on the status
    if(status == "OK")
      return 100
    end
    if( status== "NOT_FOUND")
      return 101
    end
    if( status=="ZERO_RESULTS")
      return 102
    end
    if(status=="MAX_WAYPOINTS_EXCEEDED")
      return 103
    end
    if(status =="INVALID_REQUEST")
      return 104
    end
    if(status =="OVER_QUERY_LIMIT")
      return 105
    end
    if(status =="REQUEST_DENIED")
      return 106
    end
    
    #unknown error return  
    return 107
  end

  # shall get points of each route 
  def get_points(jsonRoute)
    
    jsonRoute = JSON.parse(jsonRoute)

    # array to hold our our collection of points
    arrayOfCoordinates = Array.new()
   

    lat = jsonRoute['routes'][0]['legs'][0]['start_location']['lat']
    lng = jsonRoute['routes'][0]['legs'][0]['start_location']['lng']

    firstPoint = Array.new()
    firstPoint.push(lat)
    firstPoint.push(lng)
    
    arrayOfCoordinates.push(firstPoint)
   
    steps = jsonRoute['routes'][0]['legs'][0]['steps']

    # go through each step
    steps.each do |step|
      
      # each step, get lat. & lng. location and push 
      lat = step["end_location"]["lat"]
      lng = step["end_location"]["lng"]
   
      endCoordinates = Array.new()
      endCoordinates.push(lat)
      endCoordinates.push(lng)
  
      arrayOfCoordinates.push(endCoordinates)
      
    end
    
    return arrayOfCoordinates

  end

end
