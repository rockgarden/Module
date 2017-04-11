//
//  Badge.swift
//

import UIKit

open class Badge: UILabel {
    
    internal var topConstraint: NSLayoutConstraint?
    internal var centerXConstraint: NSLayoutConstraint?
    
    var bc = UIColor.red.cgColor

    open class func badge() -> Badge {
        return Badge.init(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = frame.size.width / 2
        
        configureNumberLabel()

        translatesAutoresizingMaskIntoConstraints = false
        createSizeConstraints(frame.size)
    }
    
    override open var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += 10.0
        return contentSize
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // PRAGMA: create
    
    internal func createSizeConstraints(_ size: CGSize) {
        let widthConstraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: size.width)
        self.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: size.height)
        self.addConstraint(heightConstraint)
    }
    
    fileprivate func configureNumberLabel()  {
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 12)
        textColor = UIColor.white
    }
    
    // PRAGMA: helpers
    
    open func addBadgeOnView(_ onView:UIView) {
        onView.addSubview(self)

        topConstraint = NSLayoutConstraint(item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: onView,
            attribute: .top,
            multiplier: 1,
            constant: 3)
        onView.addConstraint(topConstraint!)
        
        centerXConstraint = NSLayoutConstraint(item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: onView,
            attribute: .centerX,
            multiplier: 1,
            constant: 10)
        onView.addConstraint(centerXConstraint!)
    }
}
