import CoreLocation
import SwiftLocation


class WeatherLocation{
    static let shared = WeatherLocation()
    private init(){}
    
    var loc:CLLocation?
    var currentLocation:Bool=true
    
    func getCurrentLocation(){
        Location.getLocation(accuracy: .city, frequency: .significant, success: { (locationRequest, location) -> (Void) in
            print (location)
            
            if (!self.currentLocation){
                locationRequest.cancel()
            }
        }) { (locationRequest, location, error) -> (Void) in
            print(error)
        }
    }
}
