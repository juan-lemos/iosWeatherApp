//import UIKit
//
//
//class ModelManager  {
//    
//    var itemsList = [Item]()
//    //static because sigleton
//    static let shared = ModelManager() //is only call when is null LEAZY LOAD
//    
//    init() {
//        itemsList = getItems()
//    }
//    
//    func save() {
//        saveItems(items: itemsList)
//    }
//    
//    
//    func addItem(item: Item) {
//        itemsList.append(item)
//    }
//    
//    func updateItem(item: Item, atIndex: Int){
//        itemsList[atIndex] = item
//    }
//    
//    func updateItemState(newState: Bool, atIndex: Int){
//        itemsList[atIndex].state = newState
//    }
//    
//    func deleteAllItems(){
//        itemsList.removeAll()
//    }
//    
//    //save all items into in a dictionary in dictionary format
//    private  func saveItems( items:[Item]){
//        var itemDics : [[String:String]] = [[String:String]]()
//        for item in items{
//            itemDics.append(Item.toDictionary(item))
//        }
//        saveItemsDic(itemDics)
//    }
//    
//    //get all items from  dic format to item list
//    private  func getItems( )-> [Item]{
//        let dics = getItemsDic()
//        var itemList : [Item] = [Item]()
//        for dic in dics{
//            itemList.append(Item.toItem(dic))
//        }
//        return itemList
//    }
//    
//    //save dic list into a userdefaults
//    private func saveItemsDic (_ itemsList :  [[String : String]] ) {
//        
//        
//        UserDefaults.standard.setValue(itemsList, forKey: "0")
//    }
//    
//    //get user default diccionary
//    private func getItemsDic () ->[[String : String]] {
//        if let itemDics = UserDefaults.standard.object(forKey: "0") as? [[String : String]] {
//            return itemDics
//        }
//        else{
//            return [[String:String]]()
//        }
//    }
//}
