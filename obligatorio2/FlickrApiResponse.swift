//
//import Foundation
//import ObjectMapper
//
//class WeatherDay : Mappable {
//    var day:Int?
//    var id:Int?
//    var icon:String?
//    var temp:Int?
//    
//    required init?(map : Map){
//    }
//    
//    func mapping(map: Map) {
//        id <- map["dt"]
//        owner <- map["weather.0.icon"]
//        secret <- map["weather.0.id"]
//        
//        server <- map["temp.eve"]
//        title
//    }
//    
//}
