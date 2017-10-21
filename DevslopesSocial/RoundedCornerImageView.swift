//
//  RoundedCornerImageView.swift
//  DevslopesSocial
//
//  Created by exxe on 21/10/2017.
//  Copyright © 2017 exxe. All rights reserved.
//

import UIKit

class RoundedCornerImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 3.5
    }

}
