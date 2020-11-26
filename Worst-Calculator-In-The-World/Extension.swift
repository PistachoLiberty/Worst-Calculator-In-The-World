//
//  Config.swift
//  Worst-Calculator-In-The-World
//
//  Created by Nawras Janoudi on 10/25/20.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // safe area insets
        var topInsets = CGFloat(0)
        var leftInsets = CGFloat(0)
        var bottomInsets = CGFloat(0)
        var rightInsets = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInsets = insets.top
            leftInsets = insets.bottom
            bottomInsets = insets.bottom
            rightInsets = insets.right
            
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInsets).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft+leftInsets).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInsets).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight-rightInsets).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            widthAnchor.constraint(equalToConstant: height).isActive = false
        }
    }
    
}
