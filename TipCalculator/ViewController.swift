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
    
    @IBOutlet weak var InputView: UIView!
    @IBOutlet weak var ResultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        getSavedTipChoice()
        getSavedBillAmount()
        calculateTip(self)
        let bill = Double(BillTextField.text!) ?? 0;
        if (bill == 0) {
            hideResults()
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        BillTextField.becomeFirstResponder()
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
        self.TipLabel.text = formatAmount(amount: tip)
        self.TotalLabel.text = formatAmount(amount: total)
        saveBillAmount()
        showResultsView()
    }
    
    func formatAmount(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: amount as NSNumber)!
    }

    func getSavedTipChoice() {
        let userSettings = UserSettings()
        TipControl.selectedSegmentIndex = userSettings.getTipPercentageChoiceIndex();
    }
    
    func hideResults() {
        // Set the opacity of results view to 0
        UIView.animate(withDuration: 0.4, animations: {
            self.ResultView.alpha = 0
        })
    }
    
    func showResultsView() {
        // when the user changes the input text, then add the result view.
        UIView.animate(withDuration: 0.4, animations: {
            self.ResultView.alpha = 1
        })
    }
    
    func getSavedBillAmount() {
        let userSettings = UserSettings()
        if (userSettings.isBillAmountSet()) {
            BillTextField.text = userSettings.getBillAmount()
        }
    }
    
    func saveBillAmount() {
        let userSettings = UserSettings()
        userSettings.saveBillAmount(billAmount: BillTextField.text!)
    }
}

