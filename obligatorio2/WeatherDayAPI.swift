
import Foundation
import ObjectMapper

class WeatherDayAPI : Mappable {
    var day:Int?
    var id:Int?
    var icon:String?
    var temp:Int?

    required init?(map : Map){
    }
    
    func mapping(map: Map) {
        day <- map["dt"]
        icon <- map["weather.0.icon"]
        id <- map["weather.0.id"]
        //icon = WeatherIcon(condition: id ?? 3, iconString: iconApi ?? "").iconText
        temp <- map["temp.eve"]
    }
    
    static func toWeatherDayList(weatherDayApiList: [WeatherDayAPI]) -> [WeatherDay]?{
        var weatherDayList = [WeatherDay]()
        for weatherAPI in weatherDayApiList {
            guard weatherAPI.day != nil, weatherAPI.icon != nil ,
                weatherAPI.id != nil , weatherAPI.temp != nil else {
                return nil
            }
            weatherDayList.append(WeatherDay(weatherAPI.day!, weatherAPI.id!, weatherAPI.icon!, weatherAPI.temp!))
        }
        return weatherDayList
        
    }
    
}
