import UIKit

class MainViewController:UIViewController{
    //MARK: -constraints
    @IBOutlet weak var cityLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var weatherIconTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var temperatureTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    //MARK: -elements
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherIconLabel.text = WeatherIcon(condition: 201, iconString: "01n").iconText
    }


}
