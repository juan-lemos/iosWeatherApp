//
//  WeatherApi.swift
//  obligatorio2
//
//  Created by SP 25 on 7/6/17.
//  Copyright © 2017 UCUDAL. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class FlickrAPI {
    
    public static let shared = FlickrAPI()
    let url = "https://api.flickr.com/services/rest/?"
    
    
    func getWeather( _ onCompletition: @escaping (_ weatherDay : [WeatherDay]?, _ error: Error? ) -> Void) {
        let parameters : [String:Any]  = [
            "method" : "flickr.photos.search",
            "api_key" : ApisKey.apiKeyFlickr.rawValue,
            "text" : "montevideo",
            "format" : "json",
            "per_page" : "1",
            "nojsoncallback": "1"
        ]
        
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: [:]).validate().responseJSON {
            (response : DataResponse<Any>) -> () in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if let aa = json.dictionary?["photos"]{
                    
                    print(aa)
                    //print(aa)
                   // let weather = Mapper<WeatherDay>().mapArray(JSONObject:aa.rawValue)
                    //                    print ("ds")
                }
                
                //print(json.dictionary!["list"])
                //let weather = Mapper<WeatherDay>().mapArray(JSONObject:json.dictionary?["list"])
                
                
                //                let universities = Mapper<University>().mapArray(JSONObject: json.rawValue)
                //                onCompletion(universities, nil)
            //                print("hola")
            case .failure( _):
                print("ERROR")
                
                
                //                onCompletion(nil, error)
            }
            
        }
    }
}
