import UIKit
import MapKit
class SettingsViewController:UIViewController{

    @IBOutlet weak var mapView: MKMapView!
    @IBAction func cacelarButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardarButtonAction(_ sender: Any) {
        
    }
    
    
    
    
}
