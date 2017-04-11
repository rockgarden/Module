

import UIKit
import Material

class TransitionedViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.purple.base
        
        prepareToolbar()
    }
}

extension TransitionedViewController {
    fileprivate func prepareToolbar() {
        guard let tc = toolbarController else {
            return
        }
        
        tc.toolbar.title = "Transitioned"
        tc.toolbar.detail = "View Controller"
    }
}

