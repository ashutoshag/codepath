//
//  UserSettings.swift
//  TipCalculator
//
//  Created by Ashutosh Agarwal on 7/9/17.
//  Copyright © 2017 Ashutosh Agarwal. All rights reserved.
//

import UIKit

class UserSettings {
    
    private let TIP_SEGMENT_KEY =  "default_tip_segment_index";
    private let LAST_BILL_AMOUNT_KEY = "last_bill_amount";
    private let LAST_BILL_TIMESTAMP_KEY = "last_bill_timestamp";
    
    public func getTipPercentageChoiceIndex() -> Int {
        let index = UserDefaults.standard.object(forKey: TIP_SEGMENT_KEY)
        let intIndex = (index as? Int) ?? 0
        return intIndex
    }
    
    public func saveTipPercentageChoiceIndex(index: Int) {
        UserDefaults.standard.set(index, forKey: TIP_SEGMENT_KEY)
        UserDefaults.standard.synchronize()
    }
    
    public func saveBillAmount(billAmount: String) {
        UserDefaults.standard.set(billAmount, forKey: LAST_BILL_AMOUNT_KEY)
        UserDefaults.standard.set(Date(), forKey: LAST_BILL_TIMESTAMP_KEY)
    }
    
    public func isBillAmountSet() -> Bool {
        if getBillAmount().isEmpty {
            return false;
        }

        let billDateObject = UserDefaults.standard.object(forKey: LAST_BILL_TIMESTAMP_KEY)
        let todaysDate = Date()
        let billDate = (billDateObject as? Date) ?? todaysDate
        let calendar = NSCalendar.current
        let billDateInCalendar = calendar.startOfDay(for: billDate)
        let todaysDateInCalendar = calendar.startOfDay(for: todaysDate)
        
        let days = calendar.dateComponents([.minute], from: billDateInCalendar, to: todaysDateInCalendar)
        print("days in middle: \(days)")
        if (days.minute! <= 10) {
            return true
        }
        return false
    }
    
    public func getBillAmount() -> String {
        let billAmountObject = UserDefaults.standard.object(forKey: LAST_BILL_AMOUNT_KEY)
        let billAmount = (billAmountObject as? String) ?? ""
        return billAmount
    }
}

