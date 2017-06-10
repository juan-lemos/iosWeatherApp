enum TemperatureUnit:String
{
    case C="°C"
    case F="°F"
    
    
    static func fromStringToTemp(str:String) -> TemperatureUnit {
        if (str == "°C"){
            return .C
        }else{
            return .F
        }
    }
}
