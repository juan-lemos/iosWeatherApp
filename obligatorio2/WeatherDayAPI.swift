
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
    
}
