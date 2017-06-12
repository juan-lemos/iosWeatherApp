
import Foundation
import ObjectMapper

class FlickrApiResponse : Mappable {
    var farm:Int?
    var server:String?
    var id:String?
    var secret:String?
    
    
    required init?(map : Map){
    }
    
    func mapping(map: Map) {
        self.farm <- map["farm"]
        self.server <- map["server"]
        self.id <- map["id"]
        self.secret <- map["secret"]
    }
    
    
    func getUrl() -> String? {
        guard farm != nil , server != nil, id != nil, secret != nil else{
            return nil
        }
        return "https://farm\(farm!).staticflickr.com/\(server!)/\(id!)_\(secret!)_b.jpg"
    }
}
