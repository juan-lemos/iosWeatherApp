import CoreLocation
import SwiftLocation

class LocationSave{
    
    //=============================================================================
    //MARK: -variables
    var actualLocation = true
    var latitude:Double = 0
    var longitude:Double = 0
    var city:String = "..."
    
    public static let shared:LocationSave = LocationSave()
    
    //=============================================================================
    //MARK: -private initializer
    private init(){}
    
    //=============================================================================
    //MARK: -methods to call city
    
    func actualLocationAndCallWeatherApi(completion:@escaping (Error?)->()){
        if actualLocation{
            Location.getLocation(accuracy: .city, frequency: .oneShot,
                                 success: {(locationRequest, location) -> (Void) in
                                    self.latitude = location.coordinate.latitude
                                    self.longitude = location.coordinate.longitude
                                    self.setCity(location: location, completion: {
                                        completion(nil)
                                    })
            }, error: { (_, _, _) -> (Void) in
                completion(nil)
            })
        }else{
            self.setCity(location: CLLocation(latitude: self.latitude, longitude: self.longitude), completion: {
                completion(nil)
            })
            
        }
    }
    
    private func setCity(location:CLLocation, completion:@escaping ()->()) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            // Place details
            if let placeMark = placemarks?[0]{
                // City
                if let city = placeMark.addressDictionary!["City"] as? NSString {
                    self.city = "\(city)"
                    completion()
                    return
                }
            }
            self.city = "..."
            completion()
            return
        })
    }
    
    //=============================================================================
    //MARK: -methods called from SettingsViewController
    
    
    func getCoordinates()->CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func setCoordinates( coordinates:CLLocationCoordinate2D ){
        self.latitude = coordinates.latitude
        self.longitude  = coordinates.longitude
    }
    
    //=============================================================================
    //MARK: -save and restore from storage methods
    
    func saveModel() -> [String:String]{
        var dic = [String: String]()
        dic["actualLocation"] = "\(actualLocation)"
        dic["latitud"] = "\(latitude)"
        dic["longitude"] = "\(longitude)"
        dic["city"] = city
        return dic
    }
    
    func loadModel(model : [String:String]){
        if (model["actualLocation"] == "false"){
            actualLocation = false
        }else{
            actualLocation = true
        }
        latitude = Double(model["latitud"]!)!
        longitude = Double(model["longitude"]!)!
        city = model["city"]!
    }
    
}
