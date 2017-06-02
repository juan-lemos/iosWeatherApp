//
//  ViewController.swift
//  obligatorio2
//
//  Created by SP26 on 31/5/17.
//  Copyright © 2017 UCUDAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let apiKeyFlickr="367177708eea2e6aacc74ecb2f7df7e9"
    let apiKeyWeather="3fdfe953978d07aa5640637b1d9ad16c"
    @IBOutlet weak var weatherIconLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherIconLabel.text = WeatherIcon(condition: 201, iconString: "01n").iconText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}

