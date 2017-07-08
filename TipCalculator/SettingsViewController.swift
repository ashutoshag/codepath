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
    
    let TIP_SEGMENT_KEY =  "default_tip_segment_index";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        getSavedTipChoice()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getSavedTipChoice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getSavedTipChoice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveSelectedSegmentIndex();
    }
    
    @IBAction func onDefaultTipChoiceChange(_ sender: Any) {
        saveSelectedSegmentIndex()
    }
    
    func saveSelectedSegmentIndex() {
        let index = DefaultTipController.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: TIP_SEGMENT_KEY)
        defaults.synchronize()
    }
    
    func getSavedTipChoice() {
        let defaults = UserDefaults.standard
        let index = defaults.object(forKey: TIP_SEGMENT_KEY)
        let intIndex = (index as? Int) ?? 0
        print(String(format: "Selected default index: %d", intIndex))
        DefaultTipController.setEnabled(true, forSegmentAt: intIndex);
    }
}
