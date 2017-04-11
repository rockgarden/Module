
import UIKit
import Material

class RemindersViewController: UIViewController {
    
//    convenience init() {
//        self.init(nibName: nil, bundle: nil)
//        prepareTabBarItem()
//    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.yellow.base
    }
}

extension RemindersViewController {
    fileprivate func prepareTabBarItem() {
        tabBarItem.image = Icon.cm.bell?.tint(with: Color.blueGrey.base)
        tabBarItem.selectedImage = Icon.cm.bell?.tint(with: Color.blue.base)
    }
}
