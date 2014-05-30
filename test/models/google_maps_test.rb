require 'test/unit'
include GoogleMapsHelper

class GoogleMapsTest < Test::Unit::TestCase
 
    #TEST FOR DIRECTIONS

    def test_directions

       params1 = {:origin => "La Jolla,CA",:destination => "Riverside CA" }
       params2 = {:origin => nil,:destination => nil }
       params3 = {:origin => "La Jolla,CA",:destination => nil }
       params4 = {:origin => nil,:destination => "Riverside CA" }
       params5 = {:origin => nil, :destination=> "" }
       params6 = {:origin => "",:destination => nil }
       params7 = {:origin => "",:destination => "" }
       params8 = {:origin => "Argentina",:destination => "Riverside CA" }
       params9 = {:origin => "joacobkjaods",:destination => "Rfsdajklaos" }
       params10 = {:origin => "La Jolla,CA",:destination => "sdafjkldsajis" }
       params11 = {:origin => "fdsjakl324k2ldls",:destination => "sdaffds" }
       params12 = {:origin => "fdsjakl324k2ldls",:destination => "sdaffds" }
       params13 = {:origin => "FLOOOR NOO",:destination => "MAKA MAKA POOK" }
       params14 = {:origin => "KOONNOONI KOOWOWOWO",:destination => "La Jolla CA 92092" }
       params15 = {:origin => "La JOLLA CA 92092",:destination => "konoisisa" }

       json1 = GoogleMaps.get_directions_json(params1)
       json2 = GoogleMaps.get_directions_json(params2)
       json3 = GoogleMaps.get_directions_json(params3)
       json4 = GoogleMaps.get_directions_json(params4)
       json5 = GoogleMaps.get_directions_json(params5)
       json6 = GoogleMaps.get_directions_json(params6)
       json7 = GoogleMaps.get_directions_json(params7)
       json8 = GoogleMaps.get_directions_json(params8)
       json9 = GoogleMaps.get_directions_json(params9)
       json10 = GoogleMaps.get_directions_json(params10)
       json11 = GoogleMaps.get_directions_json(params11)
       json12 = GoogleMaps.get_directions_json(params12)
       json13 = GoogleMaps.get_directions_json(params13)
       json14 = GoogleMaps.get_directions_json(params14)
       json15 = GoogleMaps.get_directions_json(params15)

       assert_equal(json1.class, String, "json1, Types don't match")
       assert_equal(json2.class, String, "json2, Types don't match")
       assert_equal(json3.class, String, "json3, Types don't match")
       assert_equal(json4.class, String, "json4, Types don't match")
       assert_equal(json5.class, String, "json5, Types don't match")
       assert_equal(json6.class, String, "json6, Types don't match")
       assert_equal(json7.class, String, "json7, Types don't match")
       assert_equal(json8.class, String, "json8, Types don't match")
       assert_equal(json9.class, String, "json9, Types don't match")
       assert_equal(json10.class, String, "json10, Types don't match")
       assert_equal(json11.class, String, "json11, Types don't match")
       assert_equal(json12.class, String, "json12, Types don't match")
       assert_equal(json13.class, String, "json13, Types don't match")
       assert_equal(json14.class, String, "json14, Types don't match")
       assert_equal(json15.class, String, "json15, Types don't match")
       
    end

    # TEST FOR STATUS CHECKING
    def test_status

       params1 = {:origin => "La Jolla,CA",:destination => "Riverside CA" }
       params2 = {:origin => nil,:destination => nil }
       params3 = {:origin => "La Jolla,CA",:destination => nil }
       params4 = {:origin => nil,:destination => "Riverside CA" }
       params5 = {:origin => nil, :destination=> "" }
       params6 = {:origin => "",:destination => nil }
       params7 = {:origin => "",:destination => "" }
       params8 = {:origin => "Argentina",:destination => "Riverside CA" }
       params9 = {:origin => "joacobkjaods",:destination => "Rfsdajklaos" }
       params10 = {:origin => "La Jolla,CA",:destination => "sdafjkldsajis" }
       params11 = {:origin => "fdsjakl324k2ldls",:destination => "sdaffds" }
       params12 = {:origin => "fdsjakl324k2ldls",:destination => "sdaffds" }
       params13 = {:origin => "FLOOOR NOO",:destination => "MAKA MAKA POOK" }
       params14 = {:origin => "KOONNOONI KOOWOWOWO",:destination => "La Jolla CA 92092" }
       params15 = {:origin => "La JOLLA CA 92092",:destination => "konoisisa" }

       json1 = GoogleMaps.get_directions_json(params1)
       json2 = GoogleMaps.get_directions_json(params2)
       json3 = GoogleMaps.get_directions_json(params3)
       json4 = GoogleMaps.get_directions_json(params4)
       json5 = GoogleMaps.get_directions_json(params5)
       json6 = GoogleMaps.get_directions_json(params6)
       json7 = GoogleMaps.get_directions_json(params7)
       json8 = GoogleMaps.get_directions_json(params8)
       json9 = GoogleMaps.get_directions_json(params9)
       json10 = GoogleMaps.get_directions_json(params10)
       json11 = GoogleMaps.get_directions_json(params11)
       json12 = GoogleMaps.get_directions_json(params12)
       json13 = GoogleMaps.get_directions_json(params13)
       json14 = GoogleMaps.get_directions_json(params14)
       json15 = GoogleMaps.get_directions_json(params15)

       status1 = GoogleMaps.get_status(json1)
       status2 = GoogleMaps.get_status(json2)
       status3 = GoogleMaps.get_status(json3)
       status4 = GoogleMaps.get_status(json4)
       status5 = GoogleMaps.get_status(json5)
       status6 = GoogleMaps.get_status(json6)
       status7 = GoogleMaps.get_status(json7)
       status8 = GoogleMaps.get_status(json8)
       status9 = GoogleMaps.get_status(json9)
       status10 = GoogleMaps.get_status(json10)
       status11 = GoogleMaps.get_status(json11)
       status12 = GoogleMaps.get_status(json12)
       status13 = GoogleMaps.get_status(json13)
       status14 = GoogleMaps.get_status(json14)
       status15 = GoogleMaps.get_status(json15)

       assert_equal(100, status1, "Status 1 does not match result")
       assert_equal(104, status2, "Status 2 does not match result")
       assert_equal(100, status3, "Status 3 does not match result")
       assert_equal(100, status4, "Status 4 does not match result")
       assert_equal(104, status5, "Status 5 does not match result")
       assert_equal(104, status6, "Status 6 does not match result")
       assert_equal(104, status7, "Status 7 does not match result")
       assert_equal(102, status8, "Status 8 does not match result")
       assert_equal(101, status9, "Status 9 does not match result")
       assert_equal(101, status10, "Status 10 does not match result")
       assert_equal(101, status11, "Status 11 does not match result")
       assert_equal(101, status12, "Status 12 does not match result")
       assert_equal(101, status13, "Status 13 does not match result")
       assert_equal(101, status14, "Status 14 does not match result")
       assert_equal(101, status15, "Status 15 does not match result")
  
    end

    def test_points

       params1 = {:origin => "La Jolla,CA",:destination => "Riverside CA" }
       params3 = {:origin => "La Jolla,CA",:destination => nil }
       params4 = {:origin => nil,:destination => "Riverside CA" }

       json1 = GoogleMaps.get_directions_json(params1)
       json3 = GoogleMaps.get_directions_json(params3)
       json4 = GoogleMaps.get_directions_json(params4)
      
        

    end
 
end
