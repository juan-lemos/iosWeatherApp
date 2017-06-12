
import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON
import UIKit

class FlickrAPI {
    
    //=============================================================================
    //MARK: -variables
    
    public static let shared = FlickrAPI()
    let url = "https://api.flickr.com/services/rest/?"
    enum FlickrAPIError: Error {
        case ErrorInApi(String)
    }
    public var lastUrl = ""
    public var lastImage: UIImage = UIImage()
    
    private init() {}
    
    //=============================================================================
    //MARK: -method called from outside to get the image
    func getPhoto(latitude:Double , longitude: Double , _ onCompletition: @escaping (_ flickrImage : UIImage?, _ error: Error?) -> Void)
    {
        getApiResponse(latitude: latitude , longitude: longitude) { (flickrResponse, error) in
            if let flickrResponse = flickrResponse{
                if flickrResponse.count>0{ // OK
                    if let imageUrl = flickrResponse[0].getUrl(){
                        if imageUrl != self.lastUrl{
                            self.getImage(imageUrl: imageUrl, onCompletition: { (image) in
                                if let uiImage = image {
                                    self.lastImage=uiImage
                                    self.lastUrl = imageUrl
                                    onCompletition(uiImage,nil)
                                }else{
                                    onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
                                }
                            })
                        }else {
                            onCompletition(self.lastImage,nil)
                        }
                    }else {
                        onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
                    }
                }else{
                    onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
                }
            }else{
                onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
            }
        }
    }
    
    //=============================================================================
    //MARK: -get image from api
    private func getImage(imageUrl:String,onCompletition: @escaping (_ flickrImage : UIImage?)->Void) {
        //        let imageview = UIImageView()
        let url = URL(string: imageUrl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        let image = UIImage(data: data!)
        onCompletition(image)
    }
    
    //=============================================================================
    //MARK: -connection with api
    private func getApiResponse(latitude : Double , longitude : Double  , _ onCompletition: @escaping (_ flickrResponse : [FlickrApiResponse]?, _ error: Error? ) -> Void) {
        let parameters : [String:Any]  = [
            "method" : "flickr.photos.search",
            "api_key" : ApisKey.apiKeyFlickr.rawValue,
            "format" : "json",
            "per_page" : "1",
            "nojsoncallback": "1",
            "lat" : latitude,
            "lon" : longitude,
            "radius" : "10",
            "radius_units" : "Km",
            "sort": "relevance",
            "tags" : "city"
        ]
        
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: [:]).validate().responseJSON {
            (response : DataResponse<Any>) -> () in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let photoInfo = json.dictionary?["photos"]?.dictionary?["photo"]{
                    if let urlParameters = Mapper<FlickrApiResponse>().mapArray(JSONObject:photoInfo.rawValue){
                        onCompletition(urlParameters,nil)
                        return
                    }
                }
                onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
            case .failure(_):
                onCompletition(nil,FlickrAPIError.ErrorInApi("Error in Api"))
            }
        }
    }
}


