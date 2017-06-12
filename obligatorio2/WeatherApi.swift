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
    let url = "http://api.openweathermap.org/data/2.5/forecast/daily?"
    
    private init() {}
    enum WeatherAPIError: Error {
        case FoundNil(String)
    }
    
    func getWeekWeather(lat latNumber : Double, lon lonNumber : Double, days numberOfDays : Int, _ onCompletition: @escaping (_ weatherDay : [WeatherDay]?, _ error: Error? ) -> Void) {
        let parameters : [String:Any]  = [
            "appid" : ApisKey.apiKeyWeather.rawValue,
            "lat" : latNumber,
            "lon" : lonNumber,
            "cnt" : numberOfDays,
            "units" : "metric"]
        
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: [:]).validate().responseJSON {
            (response : DataResponse<Any>) -> () in
            
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                if let weatherList = json.dictionary?["list"]{
                    if let weatherWeekApi = Mapper<WeatherDayAPI>().mapArray(JSONObject:weatherList.rawValue){
                        if let weatherWeek = WeatherDayAPI.toWeatherDayList(weatherDayApiList: weatherWeekApi){
                            WeatherSave.shared.weekWeather = weatherWeek
                            onCompletition(weatherWeek, nil)
                            return
                        }
                    }
                }
                onCompletition(nil, WeatherAPIError.FoundNil("Error Casting"))
            case .failure(let error):
                onCompletition(nil, error)
            }
            
        }
    }
}
