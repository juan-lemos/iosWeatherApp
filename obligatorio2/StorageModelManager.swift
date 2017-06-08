import UIKit


class ModelManager  {
    //save dic list into a userdefaults
    public static func saveSettings () {
        UserDefaults.standard.setValue(LocationSave.shared.saveModel(), forKey: "locationSettings")
    }
    
    //get user default diccionary
    public static func loadSettings () {
        if let locationSettings = UserDefaults.standard.object(forKey: "locationSettings") as? [String : String] {
            LocationSave.shared.loadModel(model :locationSettings)
        }
    }
}
