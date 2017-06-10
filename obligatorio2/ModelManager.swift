import UIKit


class ModelManager  {
    //save dic list into a userdefaults
    public static func saveSettings () {
        UserDefaults.standard.setValue(LocationSave.shared.saveModel(), forKey: "locationSettings")
        UserDefaults.standard.setValue(WeatherSave.shared.saveModel(), forKey: "weather")
    }
    
    //get user default diccionary
    public static func loadSettings () {
        if let locationSettings = UserDefaults.standard.object(forKey: "locationSettings") as? [String : String] {
            LocationSave.shared.loadModel(model :locationSettings)
        }
        if let weather = UserDefaults.standard.object(forKey: "weather") as? [String : [String:String]] {
            WeatherSave.shared.loadModel(model: weather)
        }
    }
}
