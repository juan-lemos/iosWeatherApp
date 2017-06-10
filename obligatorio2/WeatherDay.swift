import Foundation

class WeatherDay{
    var day:String
    var icon:String
    var temp:Int
    
    init(_ dayApi : Int, _ idApi : Int, _ iconApi : String, _ tempApi : Int){
        day = WeatherDay.getDayOfWeek(dayApi)
        icon = WeatherIcon(condition: idApi , iconString: iconApi).iconText
        temp = tempApi
        
    }
    init(_ day : String, _ icon : String, _ temp : Int){
        self.day = day
        self.icon = icon
        self.temp = temp
    }
    
    fileprivate static func getDayOfWeek(_ seconds :Int) -> String {
        let day = Date(timeIntervalSince1970: TimeInterval(seconds))
        let formatter  = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: day)
    }
    
    
    func toDictionary() -> [String:String] {
        var dictionary = [String: String]()
        dictionary["day"] = day
        dictionary["icon"] = icon
        dictionary["temp"] = "\(temp)"
        return dictionary
    }
    
    func getTemperatureInActualUnits()->Int{
        if WeatherSave.shared.unit == .C{
            return temp
        }else {
            return (9/5)*temp+32
        }
        
    }
    
    static func fromDictionaryToWeatherDay(dictionary : [String:String]) -> WeatherDay {
        let temp :Int = Int(dictionary["temp"]!)!
        return WeatherDay(dictionary["day"]!, dictionary["icon"]!, temp)
    }
}
