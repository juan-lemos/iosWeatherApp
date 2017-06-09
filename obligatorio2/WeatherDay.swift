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
    
    fileprivate static func getDayOfWeek(_ seconds :Int) -> String {
        let day = Date(timeIntervalSince1970: TimeInterval(seconds))
        let formatter  = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: day)
    }
}
