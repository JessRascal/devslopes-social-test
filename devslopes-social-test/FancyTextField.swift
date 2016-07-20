//
//  FancyTextField.swift
//  devslopes-social-test
//
//  Created by Jess Rascal on 20/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class FancyTextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
    }
    
    // Placeholder inset
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Edit text inset
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}
