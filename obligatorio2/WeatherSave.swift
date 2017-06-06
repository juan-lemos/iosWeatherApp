import Foundation

class WeatherSave:NSObject, NSCoding{
    private let shared = WeatherSave()
    
    var weatherOfTheDay:WeatherDay?
    var nextDaysWeather:[WeatherDay]?
    var date:Date?

    
    func toSaveInStorage() {
        
        
    }
    
    
}
