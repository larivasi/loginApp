//
//  GradientUIView.swift
//  loginApp
//
//  Created by Ларин Василий on 03.10.2022.
//

import UIKit

class GradientUIView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.cyan.cgColor]
    }
}

