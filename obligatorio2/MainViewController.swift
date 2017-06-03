import UIKit

class MainViewController:UIViewController{
    
    @IBOutlet weak var weatherIconLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherIconLabel.text = WeatherIcon(condition: 201, iconString: "01n").iconText
    }


}
