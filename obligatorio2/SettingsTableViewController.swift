//
//  SettingsTableViewController.swift
//  obligatorio2
//
//  Created by JuanPablo on 6/8/17.
//  Copyright © 2017 UCUDAL. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    //=============================================================================
    //MARK: - ui cells elements
    @IBOutlet weak var temperatureUnitsSwitch: UISegmentedControl!
    @IBOutlet weak var actualLocationSwitch: UISwitch!
    
    //=============================================================================
    //MARK: - parent view
    var settingsViewController: SettingsViewController!
    
    //=============================================================================
    //MARK: - uiController methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsViewController = self.parent as! SettingsViewController
    }
    
    //=============================================================================
    //MARK: - buttons cells methods
    
    @IBAction func locationSwitchAction(_ sender: Any) {
        settingsViewController.changeActualLocationVariable(actualLocation:actualLocationSwitch.isOn)
    }
    
    @IBAction func temperatureUnitSwitchAction(_ sender: Any) {
        switch self.temperatureUnitsSwitch.selectedSegmentIndex{
        case 0:
            settingsViewController.changeTemperatureUnit(temperatureUnit: TemperatureUnit.C)
        default:
            settingsViewController.changeTemperatureUnit(temperatureUnit: TemperatureUnit.F)
        }
    }
    
    //=============================================================================
    //MARK: - methods call by SettingsViewController
    func selectTemperatureUnit(temperatureUnit:TemperatureUnit) {
        switch temperatureUnit {
        case TemperatureUnit.C:
            self.temperatureUnitsSwitch.selectedSegmentIndex=0
        default:
            self.temperatureUnitsSwitch.selectedSegmentIndex=1
        }
    }
    
    func selectActualLocationSwitch(actualLocation:Bool){
        self.actualLocationSwitch.isOn=actualLocation
    }
    
}








