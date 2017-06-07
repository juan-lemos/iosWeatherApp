import CoreLocation
import SwiftLocation

class LocationSave{
    
    public static let shared:LocationSave = LocationSave()
    private init(){}
    
    
    
    var actualLocation = true
    var latitud:Double = 0
    var longitude:Double = 0
    
    func actualAndCallWeatherApi(){
        Location.getLocation(accuracy: .city, frequency: .oneShot,
            success: {(locationRequest, location) -> (Void) in
            //call weather api
            
        }) { (locationRequest, location, error) -> (Void) in
            
        }
    }
    
    
    func saveModel() -> [String:String]{
        var dic = [String: String]()
        dic["actualLocation"] = "\(actualLocation)"
        dic["latitud"] = "\(latitud)"
        dic["longitude"] = "\(longitude)"
        return dic
    }
    
    func getModel(model : [String:String]){
        if (model["actualLocation"] == "false"){
            actualLocation = false
        }else{
            actualLocation = true
        }
        latitud = Double(model["latitud"]!)!
        longitude = Double(model["longitude"]!)!
        
    }
    
}
