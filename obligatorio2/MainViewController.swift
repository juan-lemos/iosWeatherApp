import UIKit
import EZLoadingActivity

class MainViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    //=============================================================================
    //MARK: -constraints
    @IBOutlet weak var cityLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    //=============================================================================
    //MARK: -view elements
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundViewImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    //=============================================================================
    //MARK: -constants constraints
    let cityLabelTopConstraintConstant: CGFloat = 20
    let buttonTopConstraintConstant: CGFloat = 15
    let buttonLeadingConstraintConstant: CGFloat = 4
    let buttonTrailingConstraintConstant: CGFloat = 25
    let buttonWidthConstraintConstant: CGFloat = 32
    let buttonHeightConstraintConstant: CGFloat = 33
    let collectionViewHeightConstant: CGFloat = 158
    
    let cellWeatherIconLabelTopConstraintConstant : CGFloat = 4
    let cellTemperatureLabelTopConstraintConstant : CGFloat = 3
    
    //=============================================================================
    //MARK: -constants fonts
    let cityLabelFontSize : CGFloat = 35
    let weatherIconLabelFontSize : CGFloat = 144
    let temperatureLabelFontSize : CGFloat = 62
    
    let cellDayLabelFontSize : CGFloat = 17
    let cellWeatherIconLabelFontSize : CGFloat = 39
    let cellTemperatureLabelFontSize : CGFloat = 26
    
    //=============================================================================
    //MARK: -variables of Controller
    var relationWidth:CGFloat!
    var relationHeight:CGFloat!
    let cellCollectionViewIdentifier:String="dayWeatherCollectionViewCell"
    
    //=============================================================================
    //MARK: -UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        relationWidth = Screen.shared.relationWidth
        relationHeight = Screen.shared.relationHeight
        modifyConstraintsAndFontsSizes()
        ModelManager.loadSettings()
        reloadView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EZLoadingActivity.show("", disableUI: false)
        reloadModel()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        EZLoadingActivity.hide(true, animated: true)
    }
    
    
    //=============================================================================
    //MARK: -reloadView
    func reloadModel(){
        LocationSave.shared.actualLocationAndCallWeatherApi(completion: {
            WeatherAPI.shared.getWeekWeather(lat: LocationSave.shared.latitude,
                                             lon: LocationSave.shared.longitude,
                                             days: 7) { (weatherList, error) in
                                                self.reloadView()
            }
        })
    }
    
    func reloadView()  {
        cityLabel.text=LocationSave.shared.city
        if let weekWeather =  WeatherSave.shared.weekWeather{
            
            changeBigLabelTemperature(label: temperatureLabel, temperature: "\(weekWeather[0].getTemperatureInActualUnits())" , unit: WeatherSave.shared.unit)
            weatherIconLabel.text = weekWeather[0].icon
            collectionView.reloadData()
            EZLoadingActivity.hide(true, animated: true)
            
        }
        else{
            changeBigLabelTemperature(label: temperatureLabel, temperature: "--" , unit: WeatherSave.shared.unit)
            
            
            EZLoadingActivity.hide(false, animated: true)
        }
        
    }
    
    //=============================================================================
    //MARK: -UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = collectionView.bounds.size.width / 4
        return CGSize(width: widthPerItem, height: collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //=============================================================================
    //MARK: -UICollectionDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollectionViewIdentifier,
                                                      for: indexPath) as! DayWeatherCollectionViewCell
        
        
        cell.weatherIconLabelTopConstraint.constant = cellWeatherIconLabelTopConstraintConstant * relationHeight
        cell.temperatureLabelTopConstraint.constant = cellTemperatureLabelTopConstraintConstant * relationHeight
        cell.weatherIconLabel.font = UIFont(name: cell.weatherIconLabel.font.fontName , size: cellWeatherIconLabelFontSize * relationHeight)
        var multiplier:CGFloat = 1.0
        if (Screen.shared.screenHeight==Screen.shared.iphone4sScreenHeight){//iphone4
            multiplier = 1.2
        }
        cell.dayLabel.font = UIFont(name: cell.dayLabel.font.fontName , size: cellDayLabelFontSize * relationHeight * multiplier)
        
        var day = "---"
        var icon = ""
        var temp = "--"
        
        if let weatherDay = WeatherSave.shared.weekWeather{
            day = weatherDay[indexPath.row+1].day
            icon = weatherDay[indexPath.row+1].icon
            temp = "\(weatherDay[indexPath.row+1].getTemperatureInActualUnits())"
        }
        
        cell.dayLabel.text = day
        cell.weatherIconLabel.text=icon
        changeSmallLabelTemperature(label:cell.temperatureLabel, temperature:temp, unit: WeatherSave.shared.unit)
        return cell
    }
    
    
    //=============================================================================
    //MARK: -Change UI by screen size methods
    func modifyConstraintsAndFontsSizes(){
        cityLabelTopConstraint.constant = cityLabelTopConstraintConstant * relationHeight
        buttonTopConstraint.constant = buttonTopConstraintConstant * relationHeight
        buttonLeadingConstraint.constant = buttonLeadingConstraintConstant * relationWidth
        buttonTrailingConstraint.constant = buttonTrailingConstraintConstant * relationWidth
        buttonWidthConstraint.constant = buttonWidthConstraintConstant * relationWidth
        buttonHeightConstraint.constant = buttonHeightConstraintConstant * relationHeight
        collectionViewHeight.constant = collectionViewHeightConstant * relationHeight
        
        //relative to height because we are using always portrait
        var multiplier:CGFloat = 1.0
        if (Screen.shared.screenHeight==Screen.shared.iphone4sScreenHeight){//iphone4
            multiplier = 1.2
        }
        cityLabel.font = UIFont(name: cityLabel.font.fontName , size: cityLabelFontSize * relationHeight * multiplier)
        weatherIconLabel.font = UIFont(name: weatherIconLabel.font.fontName , size: weatherIconLabelFontSize * relationHeight)
    }
    
    func changeSmallLabelTemperature(label:UILabel, temperature:String, unit:TemperatureUnit){
        changeLabelTemperature(label: label, originalMaxSize: cellTemperatureLabelFontSize, temperature: temperature, unit: unit)
    }
    
    func changeBigLabelTemperature(label:UILabel, temperature:String, unit:TemperatureUnit){
        changeLabelTemperature(label: label, originalMaxSize: temperatureLabelFontSize, temperature: temperature, unit: unit)
    }
    
    func changeLabelTemperature(label:UILabel, originalMaxSize:CGFloat, temperature:String, unit:TemperatureUnit){
        let bigFontSize = originalMaxSize * relationHeight
        let smallFontSize = bigFontSize * Screen.shared.smallBigFontTemperatureRelation
        let myMutableString = NSMutableAttributedString(string: "\(temperature)\(unit.rawValue)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: bigFontSize)!], range: NSRange(location:0,length:"\(temperature)".characters.count))
        myMutableString.addAttributes([NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: smallFontSize)!], range: NSRange(location:"\(temperature)".characters.count,length:unit.rawValue.characters.count))
        label.attributedText = myMutableString
    }
}

























