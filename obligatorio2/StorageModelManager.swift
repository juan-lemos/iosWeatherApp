import UIKit


class ModelManager  {
    
    //static because sigleton
    static let shared = ModelManager() //is only call when is null LEAZY LOAD
    
    private init() {}
    
    
    
    //save dic list into a userdefaults
    private func saveItemsDic (_ itemsList :  [[String : String]] ) {
        UserDefaults.
        
        UserDefaults.standard.setValue(itemsList, forKey: "0")
    }
    
    //get user default diccionary
    private func getItemsDic () ->[[String : String]] {
        if let itemDics = UserDefaults.standard.object(forKey: "0") as? [[String : String]] {
            return itemDics
        }
        else{
            return [[String:String]]()
        }
    }
}
