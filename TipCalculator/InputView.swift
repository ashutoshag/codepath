//
//  InputView.swift
//  TipCalculator
//
//  Created by Ashutosh Agarwal on 7/8/17.
//  Copyright © 2017 Ashutosh Agarwal. All rights reserved.
//

import UIKit


class InputView: UIView {
    @IBOutlet var view: UIView!
    
    // Outlets to things in View.
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("InputView", owner:self, options: nil);
        self.addSubview(self.view)
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        view.frame = bounds

    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        view.prepareForInterfaceBuilder()
    }
}
