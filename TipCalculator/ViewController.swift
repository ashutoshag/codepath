//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ashutosh Agarwal on 7/8/17.
//  Copyright © 2017 Ashutosh Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillTextField: UITextField!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        print("Hello")
        view.endEditing(true);
    }

    @IBAction func tipPercentageChanged(_ sender: AnyObject) {
        calculateTip(AnyObject.self);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.20, 0.25];
        let bill = Double(BillTextField.text!) ?? 0;
        let tip = bill * tipPercentages[TipControl.selectedSegmentIndex];
        let total = bill + tip;
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
}

