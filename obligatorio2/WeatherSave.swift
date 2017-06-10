class WeatherSave{
    
    public static let shared:WeatherSave = WeatherSave()
    private init(){}
    
    var unit : TemperatureUnit = TemperatureUnit.C
    var weekWeather : [WeatherDay]?
    //    var currentWeather : WeatherDay?
    
    
    //=============================================================================
    //MARK: -save and restore from storage methods
    
    func saveModel() -> [String:[String:String]]{
        var dic = [String: [String:String]]()
        
        var unitDictionary =  [String:String]()
        unitDictionary["unit"] = unit.rawValue
        dic["unit"] = unitDictionary
        var i : Int = 0
        if let weekWeather = weekWeather{
            for weatherDay in weekWeather{
                dic["\(i)"] = weatherDay.toDictionary()
                i = i + 1
            }
        }
        return dic
    }
    
    func loadModel(model : [String:[String:String]]){
        let unit  = model["unit"]!["unit"]!
        self.unit = TemperatureUnit.fromStringToTemp(str: unit)
        var weatherList = [WeatherDay]()
        for i in 0...6 {
            let weatherDay = WeatherDay.fromDictionaryToWeatherDay(dictionary: model["\(i)"]!)
            weatherList.append(weatherDay)
        }
        self.weekWeather = weatherList
        
    }
    
}
