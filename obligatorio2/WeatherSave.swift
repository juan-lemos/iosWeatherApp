import Foundation

class WeatherSave:NSObject, NSCoding{
    private let shared = WeatherSave()
    
    var weatherOfTheDay:WeatherDay?
    var nextDaysWeather:[WeatherDay]?
    var date:Date?

    
    override init(){}
    
    required init?(coder aDecoder: NSCoder) {
        if let we = aDecoder.decodeObject(forKey: "id") as? WeatherDay{
            weatherOfTheDay = we
        }else{
            weatherOfTheDay = nil
        }
        
        if let weDays =  aDecoder.decodeObject(forKey: "nextDaysWeather") as? [WeatherDay]{
            nextDaysWeather = weDays
        }else {
            nextDaysWeather = nil
        }
        
        if let dat =  aDecoder.decodeObject(forKey: "date") as? Date{
            date = dat
        }else {
            date = nil
        }
        
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(weatherOfTheDay, forKey: "weatherOfTheDay")
        aCoder.encode(nextDaysWeather, forKey: "nextDaysWeather")
        aCoder.encode(date, forKey: "date")
        
    }
    
}
