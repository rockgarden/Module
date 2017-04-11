//
//  ItemAnimationProtocol.swift
//

import Foundation
import UIKit

public protocol ItemAnimationProtocol {
    func playAnimation(_ icon : UIImageView, textLabel : UILabel)
    func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor : UIColor)
    func selectedState(_ icon : UIImageView, textLabel : UILabel)
}

/// Base class for UITabBarItems animation
open class ItemAnimation: NSObject, ItemAnimationProtocol {
    
    // MARK: constants
    struct Constants {
        struct AnimationKeys {
            static let Scale     = "transform.scale"
            static let Rotation    = "transform.rotation"
            static let KeyFrame  = "contents"
            static let PositionY = "position.y"
            static let Opacity   = "opacity"
        }
    }
    
    // MARK: properties
    
    /// The duration of the animation
    @IBInspectable open var duration : CGFloat = 0.5
    
    /// The text color in selected state.
    @IBInspectable open var textSelectedColor = UIColor.init(red: 0, green: 0.478431, blue: 1, alpha: 1)
    
    /// The icon color in selected state.
    @IBInspectable open var iconSelectedColor: UIColor!
    
    /**
     Start animation, method call when UITabBarItem is selected
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
        fatalError("override method in subclass")
    }
    
    /**
     Start animation, method call when UITabBarItem is unselected
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    open func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor : UIColor) {
        fatalError("override method in subclass")
    }
    
    /**
     Method call when TabBarController did load
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open func selectedState(_ icon: UIImageView, textLabel : UILabel) {
        fatalError("override method in subclass")
    }
}
