//
//  BounceAnimation.swift
//

import UIKit

/// The BounceAnimation class provides bounce animation.
open class BounceAnimation : ItemAnimation {
    
    var originIconH: CGFloat?
    
    override open func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    
    override open func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor
        if let image = icon.image {
            let rm = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal :
                UIImageRenderingMode.alwaysTemplate
            let renderImage = image.withRenderingMode(rm)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    }
    
    override open func selectedState(_ icon : UIImageView, textLabel : UILabel) {
        textLabel.textColor = textSelectedColor
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
    fileprivate func playBounceAnimation(_ icon : UIImageView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: Constants.AnimationKeys.Scale)
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.2]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: nil)
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
}
