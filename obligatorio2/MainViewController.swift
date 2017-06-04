import UIKit

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
        changeBigLabelTemperature(label: temperatureLabel, temperature: "7", unit: "°C")
        
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
        
        cell.weatherIconLabelTopConstraint.constant = cell.weatherIconLabelTopConstraint.constant * relationHeight
        cell.temperatureLabelTopConstraint.constant = cell.temperatureLabelTopConstraint.constant * relationHeight
        changeSmallLabelTemperature(label:cell.temperatureLabel, temperature:"10", unit:"°C")
        cell.weatherIconLabel.font = UIFont(name: cell.weatherIconLabel.font.fontName , size: cell.weatherIconLabel.font.pointSize * relationHeight)
        
        var multiplier:CGFloat = 1.0
        if (Screen.shared.screenHeight==480.0){//iphone4
            multiplier = 1.2
        }
        cell.temperatureLabel.font = UIFont(name: cell.dayLabel.font.fontName , size: cell.dayLabel.font.pointSize * relationHeight * multiplier)
        return cell
    }
    
    
//=============================================================================
    //MARK: -Change UI methods
    func modifyConstraintsAndFontsSizes(){
        cityLabelTopConstraint.constant = cityLabelTopConstraint.constant * relationHeight
        buttonTopConstraint.constant = buttonTopConstraint.constant * relationHeight
        buttonLeadingConstraint.constant = buttonLeadingConstraint.constant * relationWidth
        buttonTrailingConstraint.constant = buttonTrailingConstraint.constant * relationWidth
        buttonWidthConstraint.constant = buttonWidthConstraint.constant * relationWidth
        buttonHeightConstraint.constant = buttonHeightConstraint.constant * relationHeight
        collectionViewHeight.constant = collectionViewHeight.constant * relationHeight
        
        //relative to height because we are using always portrait
        var multiplier:CGFloat = 1.0
        if (Screen.shared.screenHeight==480.0){//iphone4
            multiplier = 1.2
        }
        cityLabel.font = UIFont(name: cityLabel.font.fontName , size: cityLabel.font.pointSize * relationHeight * multiplier)
        weatherIconLabel.font = UIFont(name: weatherIconLabel.font.fontName , size: weatherIconLabel.font.pointSize * relationHeight)
        temperatureLabel.font = UIFont(name: temperatureLabel.font.fontName , size: temperatureLabel.font.pointSize * relationHeight)
    }
    
    func changeSmallLabelTemperature(label:UILabel, temperature:String, unit:String){
        changeLabelTemperature(label: label, originalMaxSize: CGFloat(26), temperature: temperature, unit: unit)
    }
    
    func changeBigLabelTemperature(label:UILabel, temperature:String, unit:String){
        changeLabelTemperature(label: label, originalMaxSize: CGFloat(68), temperature: temperature, unit: unit)
    }
    
    func changeLabelTemperature(label:UILabel, originalMaxSize:CGFloat, temperature:String, unit:String){
        let bigFontSize = originalMaxSize * relationHeight
        let smallFontSize = bigFontSize * Screen.shared.smallBigFontTemperatureRelation
        let myMutableString = NSMutableAttributedString(string: "\(temperature)\(unit)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: bigFontSize)!], range: NSRange(location:0,length:"\(temperature)".characters.count))
        myMutableString.addAttributes([NSFontAttributeName:UIFont(name: "HelveticaNeue-Medium", size: smallFontSize)!], range: NSRange(location:"\(temperature)".characters.count,length:unit.characters.count))
        label.attributedText = myMutableString
    }
}

























