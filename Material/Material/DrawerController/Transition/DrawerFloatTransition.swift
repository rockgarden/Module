/*
 The MIT License (MIT)
 
 Copyright (c) 2017 Kawoou (Jungwon An)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

public class DrawerFloatTransition: DrawerTransition {
    
    // MARK: - Property
    
    public var floatFactor: Float
    public var cornerRadius: CGFloat
    
    // MARK: - Lifecycle
    
    public init(floatFactor: Float = 0.1, cornerRadius: CGFloat = 5.0) {
        self.floatFactor = floatFactor
        self.cornerRadius = cornerRadius
        super.init()
    }
    
    // MARK: - Public
    
    public override func initTransition(content: DrawerContent) {
        super.initTransition(content: content)
        content.isBringToFront = false
    }
    
    public override func startTransition(content: DrawerContent, side: DrawerSide) {
        super.startTransition(content: content, side: side)
    }
    
    public override func endTransition(content: DrawerContent, side: DrawerSide) {
        super.endTransition(content: content, side: side)
        let view = content.contentView
        if side == .none {
            let layer = view.layer
            layer.shadowRadius  = 0.0
            layer.shadowColor   = UIColor.clear.cgColor
            layer.shadowOpacity = 0.0
            layer.shadowOffset  = CGSize.zero
            layer.masksToBounds = true
            guard let layer1 = view.subviews.first?.layer else {return}
            layer1.borderColor   = UIColor.clear.cgColor
            layer1.borderWidth   = 0.0
            layer1.masksToBounds = false
            layer1.cornerRadius  = 0.0
        }
    }
    
    public override func transition(content: DrawerContent, side: DrawerSide, percentage: CGFloat, viewRect: CGRect) {
        let view = content.contentView
        switch content.drawerSide {
        case .left:
            view.transform = CGAffineTransform.identity
            view.frame = CGRect(
                x: content.drawerOffset,
                y: viewRect.minY,
                width: CGFloat(content.drawerWidth),
                height: view.frame.height
            )
        case .right:
            view.transform = CGAffineTransform.identity
            view.frame = CGRect(
                x: content.drawerOffset,
                y: viewRect.minY,
                width: CGFloat(content.drawerWidth),
                height: view.frame.height
            )
        case .none:
            view.transform = CGAffineTransform(
                scaleX: CGFloat(1.0 - Float(fabs(percentage)) * self.floatFactor),
                y: CGFloat(1.0 - Float(fabs(percentage)) * self.floatFactor)
                ).translatedBy(
                    x: viewRect.size.width * percentage,
                    y: 0
            )
            addCorner(view)
            addShadow(view)
        }
    }
    
    fileprivate func addCorner(_ view: UIView) {
        guard let layer = view.subviews.first?.layer else {return}
        layer.borderColor   = UIColor.clear.cgColor
        layer.borderWidth   = 1.0
        layer.masksToBounds = true
        layer.cornerRadius  = cornerRadius
    }
    
    fileprivate func addShadow(_ view: UIView) {
        let layer = view.layer
        layer.shadowRadius  = 4.0
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
        layer.masksToBounds = false
        
        let increase = layer.shadowRadius
        var rect = view.bounds
        rect.origin.x -= increase
        rect.origin.y -= increase
        rect.size.width += increase * 2.0
        rect.size.height += increase * 2.0
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
    
}
