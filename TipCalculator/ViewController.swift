//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ashutosh Agarwal on 7/8/17.
//  Copyright © 2017 Ashutosh Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let TIP_SEGMENT_KEY =  "default_tip_segment_index";

    @IBOutlet weak var BillTextField: UITextField!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    @IBOutlet weak var InputView: UIView!
    @IBOutlet weak var ResultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        getSavedTipChoice()
        calculateTip(self)
        hideResults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        BillTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true);
    }

    @IBAction func tipPercentageChanged(_ sender: AnyObject) {
        calculateTip(AnyObject.self);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25];
        let bill = Double(BillTextField.text!) ?? 0;
        if (bill == 0) {
            hideResults()
            return
        }
        let tip = bill * tipPercentages[TipControl.selectedSegmentIndex];
        let total = bill + tip;
        self.TipLabel.text = String(format: "$%.2f", tip)
        self.TotalLabel.text = String(format: "$%.2f", total)
        
        showResultsView()
    }

    func getSavedTipChoice() {
        let defaults = UserDefaults.standard
        let index = defaults.object(forKey: TIP_SEGMENT_KEY)
        let intIndex = (index as? Int) ?? 0
        TipControl.selectedSegmentIndex = intIndex;
    }
    
    func hideResults() {
        // Hide the result view initially.
        ResultView.alpha = 0
    }
    
    func showResultsView() {
        // when the user changes the input text, then add the result view.
        ResultView.alpha = 1
    }
}

