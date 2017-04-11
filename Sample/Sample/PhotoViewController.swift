

import UIKit
import Material

class PhotoViewController: UIViewController {
    fileprivate let b1 = FlatButton(image: Icon.cm.photoLibrary, tintColor: Color.blueGrey.base)
    fileprivate let b2 = FlatButton(image: Icon.audio, tintColor: Color.blueGrey.base)
    fileprivate let b3 = FlatButton(image: Icon.cm.image, tintColor: Color.blueGrey.base)
    fileprivate let b4 = FlatButton(image: Icon.addCircle, tintColor: Color.blueGrey.base)
    fileprivate let b5 = FlatButton(image: Icon.cm.moreVertical, tintColor: Color.blueGrey.base)
    
    fileprivate let tabBar = TabBar()
    fileprivate var image: UIImage?
    open let imageView = UIImageView()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        view.backgroundColor = .white
        
        prepareTabBar()
        prepareImageView()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareNavigationBar()
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension PhotoViewController {
    @objc
    func motion(motion: Motion, willTransition fromView: UIView, toView: UIView) {
        let animations: [MotionAnimation] = [.duration(0.03), .fade(0)]
        
        b1.motion(animations)
        b2.motion(animations)
        b3.motion(animations)
        b4.motion(animations)
        b5.motion(animations)
        
        tabBar.line.motion(animations)
    }
    
    @objc
    func motion(motion: Motion, didTransition fromView: UIView, toView: UIView) {
        let animations: [MotionAnimation] = [.duration(0.03), .fade(1)]
        
        b1.motion(animations)
        b2.motion(animations)
        b3.motion(animations)
        b4.motion(animations)
        b5.motion(animations)
        
        tabBar.line.motion(animations)
    }
    
    @objc
    func motionDelayTransitionByTimeInterval(motion: Motion) -> TimeInterval {
        return 0.03
    }
}

extension PhotoViewController {
    fileprivate func prepareTabBar() {
        b1.opacity = 0
        b2.opacity = 0
        b3.opacity = 0
        b4.opacity = 0
        b5.opacity = 0
        
        b1.pulseColor = Color.blueGrey.base
        b2.pulseColor = Color.blueGrey.base
        b3.pulseColor = Color.blueGrey.base
        b4.pulseColor = Color.blueGrey.base
        b5.pulseColor = Color.blueGrey.base
        
        tabBar.buttons = [b1, b2, b3, b4, b5]
        tabBar.select(at: 2)
        tabBar.line.opacity = 0
        tabBar.motionIdentifier = "options"
        tabBar.dividerColor = Color.grey.lighten3
        view.layout(tabBar).bottom().horizontally()
    }
    
    fileprivate func prepareImageView() {
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        view.layout(imageView).horizontally().height(350).center()
    }
    
    fileprivate func prepareNavigationBar() {
        navigationItem.title = "Photo Name"
        navigationItem.detail = "Guiones, Jan 28 2017"
    }
}
