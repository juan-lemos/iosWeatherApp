import UIKit
import MapKit
class SettingsViewController:UIViewController, UIGestureRecognizerDelegate{
    
    //=============================================================================
    //MARK: -view elements
    @IBOutlet weak var mapView: MKMapView!
    private var embeddedTableViewController:SettingsTableViewController!
    
    //=============================================================================
    //MARK: -variables
    let annotation:MKPointAnnotation =  MKPointAnnotation()
    var actualLocation:Bool!
    var temperatureUnit:TemperatureUnit!
    
    //=============================================================================
    //MARK: -buttons acctions
    @IBAction func cacelarButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardarButtonAction(_ sender: Any) {
        LocationSave.shared.setCoordinates(coordinates: self.annotation.coordinate)
        LocationSave.shared.actualLocation=actualLocation
        //saveTemperatureUnit
        print(LocationSave.shared.city)
        print(self.annotation.coordinate)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //=============================================================================
    //MARK: -UIViewController methods
    //1
    override func viewDidLoad() {
        super.viewDidLoad()
        actualLocation=LocationSave.shared.actualLocation
        temperatureUnit = TemperatureUnit.C /// GO TO SAVED TEMP UNIT
        mapInitialization()
    }
    //2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SettingsTableViewController, segue.identifier == "embedTableView" {
            self.embeddedTableViewController = vc
        }
    }
    //3
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.embeddedTableViewController.selectTemperatureUnit(temperatureUnit: temperatureUnit)
        self.embeddedTableViewController.selectActualLocationSwitch(actualLocation: actualLocation)
    }
    
    //=============================================================================
    //MARK: - method cal by cell in tableviewcell
    func changeActualLocationVariable(actualLocation:Bool)  {
        self.actualLocation = actualLocation
        animateMapAppear()
    }
    
    func changeTemperatureUnit(temperatureUnit:TemperatureUnit)  {
        self.temperatureUnit=temperatureUnit
    }
    
    //=============================================================================
    //MARK: -map methods
    func mapInitialization() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureReconizer:)))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
        mapView.addAnnotation(annotation)
        annotation.coordinate = LocationSave.shared.getCoordinates()
        //show or not
        if self.actualLocation! {mapView.alpha=0}
        else{mapView.alpha=1}
    }
    
    func animateMapAppear(){
        if self.actualLocation!{
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                    self.mapView.alpha=0
                })
            }, completion: {com in
            })
        }else{
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                    self.mapView.alpha=1
                })
            }, completion: {com in
            })
        }
    }
    
    func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        // Change coordinatees annotation:
        self.annotation.coordinate = coordinate
    }
}







