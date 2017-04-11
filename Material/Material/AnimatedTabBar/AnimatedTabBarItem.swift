//
//  AnimatedTabBarItem.swift
//

import UIKit

/// UITabBarItem with animation
open class AnimatedTabBarItem: UITabBarItem {
    
    @IBInspectable open var yOffSet: CGFloat = 0
    
    open override var isEnabled: Bool {
        didSet {
            iconView?.icon.alpha = isEnabled == true ? 1 : 0.5
            iconView?.textLabel.alpha = isEnabled == true ? 1 : 0.5
        }
    }
    
    /// animation for UITabBarItem. or create custom anmation inherit ItemAnimation
    @IBOutlet open var animation: ItemAnimation!
    
    /// The font used to render the UITabBarItem text.
    open var textFont = UIFont.systemFont(ofSize: 10)
    
    /// The color of the UITabBarItem text.
    @IBInspectable open var textColor = UIColor.black
    
    /// The tint color of the UITabBarItem icon.
    @IBInspectable open var iconColor = UIColor.clear // if alpha color is 0 color ignoring
    
    var bgDefaultColor = UIColor.clear
    var bgSelectedColor = UIColor.clear
    
    /// The current badge value
    open var badge: Badge? // use badgeValue to show badge
    
    /// Container for icon and text in UITableItem.
    open var iconView: (icon: UIImageView, textLabel: UILabel)?
    
    /// Start selected animation
    open func playAnimation() {
        assert(animation != nil, "add animation in UITabBarItem")
        guard animation != nil && iconView != nil else  {
            return
        }
        animation.playAnimation(iconView!.icon, textLabel: iconView!.textLabel)
    }
    
    /// Start unselected animation
    open func deselectAnimation() {
        guard animation != nil && iconView != nil else { return }
        animation.deselectAnimation(
            iconView!.icon,
            textLabel: iconView!.textLabel,
            defaultTextColor: textColor,
            defaultIconColor: iconColor)
    }
    
    /// Set selected state without animation
    open func selectedState() {
        guard animation != nil && iconView != nil else  {
            return
        }
        animation.selectedState(iconView!.icon, textLabel: iconView!.textLabel)
    }
}


// MARK: Custom Badge
extension AnimatedTabBarItem {
    /// The current badge value
    override open var badgeValue: String? {
        get {
            return badge?.text
        }
        set(newValue) {
            if newValue == nil {
                badge?.removeFromSuperview()
                badge = nil
                return
            }
            if let iconView = iconView, let contanerView = iconView.icon.superview , badge == nil {
                badge = Badge.badge()
                badge!.addBadgeOnView(contanerView)
            }
            badge?.text = newValue
        }
    }
}
