import UIKit

class MainViewController:UIViewController{
    //MARK: -constraints
    @IBOutlet weak var cityLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    
    //MARK: -elements
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        modifyConstraintsAndFontsSizes(screenSize:screenSize)
        
        print(cityLabel.font.pointSize)
        
        //print(temperatureLabel.size)
        
//        print(temperatureLabel.font.pointSize)
//        temperatureLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 68.0)
//        print(temperatureTopConstraint.constant)
//        temperatureTopConstraint.constant=100
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.weatherIconLabel.text = WeatherIcon(condition: 201, iconString: "01n").iconText
    }

    
    //MARK: -utils methods
    
    func modifyConstraintsAndFontsSizes( screenSize:CGRect){
        let originalWidth:CGFloat = 375.0
        let originalHeigth:CGFloat = 667.0
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let relationWidth = screenWidth/originalWidth
        let relationHeight = screenHeight/originalHeigth
        
        
        
        cityLabelTopConstraint.constant = cityLabelTopConstraint.constant * relationHeight
        buttonTopConstraint.constant = buttonTopConstraint.constant * relationHeight
        buttonLeadingConstraint.constant = buttonLeadingConstraint.constant * relationWidth
        buttonTrailingConstraint.constant = buttonTrailingConstraint.constant * relationWidth
        buttonWidthConstraint.constant = buttonWidthConstraint.constant * relationWidth
        buttonHeightConstraint.constant = buttonHeightConstraint.constant * relationHeight
        collectionViewHeight.constant = collectionViewHeight.constant * relationHeight
        
        cityLabel.font = UIFont(name: cityLabel.font.fontName , size: cityLabel.font.pointSize * relationHeight)
        weatherIconLabel.font = UIFont(name: weatherIconLabel.font.fontName , size: weatherIconLabel.font.pointSize * relationHeight)
        temperatureLabel.font = UIFont(name: temperatureLabel.font.fontName , size: temperatureLabel.font.pointSize * relationHeight)
        
    }
    
}

























