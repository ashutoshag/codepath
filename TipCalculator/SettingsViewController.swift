//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ashutosh Agarwal on 7/8/17.
//  Copyright © 2017 Ashutosh Agarwal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultTipController: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        getSavedTipChoice()
    }

    override func viewWillDisappear(_ animated: Bool) {
        saveSelectedSegmentIndex();
    }
    
    @IBAction func onDefaultTipChoiceChange(_ sender: Any) {
        saveSelectedSegmentIndex()
    }
    
    func saveSelectedSegmentIndex() {
        let userSettings = UserSettings()
        userSettings.saveTipPercentageChoiceIndex(index: DefaultTipController.selectedSegmentIndex)
    }
    
    func getSavedTipChoice() {
        let userSettings = UserSettings()
        DefaultTipController.selectedSegmentIndex = userSettings.getTipPercentageChoiceIndex()
    }
}
