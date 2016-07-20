//
//  HeaderView.swift
//  devslopes-social-test
//
//  Created by Jess Rascal on 20/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
    }

}
