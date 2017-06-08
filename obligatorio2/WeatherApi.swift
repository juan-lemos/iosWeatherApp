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

class WeatherAPI {
    
    public static let shared = WeatherAPI()
    let apiKey = "e6af736c0553519abc789a53eff777da" //enum
    let url = "http://api.openweathermap.org/data/2.5/forecast/daily?"
    
    
    func getWeather(lat latNumber : Double, lon lonNumber : Double, days numberOfDays : Int, _ onCompletition: @escaping (_ weatherDay : [WeatherDay]?, _ error: Error? ) -> Void) {
        let parameters : [String:Any]  = [
            "appid" : apiKey,
            "lat" : latNumber,
            "lon" : lonNumber,
            "cnt" : numberOfDays,
            "units" : "metric"]
        
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: [:]).validate().responseJSON {
            (response : DataResponse<Any>) -> () in
            
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if let aa = json.dictionary?["list"]{
                    
                    
                    //print(aa)
                    let weather = Mapper<WeatherDay>().mapArray(JSONObject:aa.rawValue)
                    print ("ds")
                }
                
                //print(json.dictionary!["list"])
                //let weather = Mapper<WeatherDay>().mapArray(JSONObject:json.dictionary?["list"])
                
              
                //                let universities = Mapper<University>().mapArray(JSONObject: json.rawValue)
                //                onCompletion(universities, nil)
                print("hola")
            case .failure(let _):
                print("hla")
                
                
                //                onCompletion(nil, error)
            }
            
        }
    }
}
