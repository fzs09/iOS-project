//
//  Utils.swift
//  ProjectMobil
//
//  Created by mobioapp on 7/19/17.
//  Copyright © 2017 MobioApp2. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    func moveTextField(view: UIView, textfield: UITextField, moveDistance: Int, up: Bool) {
        let duration = 0.3
        let distance: CGFloat = CGFloat(up ? -moveDistance: moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(duration)
        view.frame = view.frame.offsetBy(dx: 0, dy: distance)
        UIView.commitAnimations()
    }

}
