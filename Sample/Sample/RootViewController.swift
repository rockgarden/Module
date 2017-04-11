
import UIKit
import Material

class RootViewController: UIViewController {
    
    fileprivate var buttons = [Button]()
    fileprivate var tabBar: TabBar!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.white
        
        prepareToolbar()
        prepareButtons()
        prepareTabBar()
    }
}

extension RootViewController {
    
    fileprivate func prepareToolbar() {
        guard let toolbar = toolbarController?.toolbar else {
            return
        }
        
        toolbar.title = "Material"
        toolbar.titleLabel.textColor = .white
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detail = "Build Beautiful Software"
        toolbar.detailLabel.textColor = .white
        toolbar.detailLabel.textAlignment = .left
    }
    
    fileprivate func prepareButtons() {
//        let btn1 = FlatButton(title: "Bar", titleColor: Color.blueGrey.base)
//        btn1.pulseAnimation = .none
//        btn1.tag = 1
//        buttons.append(btn1)

        let btn2 = FlatButton(title: "TableInCard", titleColor: Color.blueGrey.base)
        btn2.pulseAnimation = .none
        btn2.tag = 2
        buttons.append(btn2)
        
        let btn3 = FlatButton(title: "CollectionView", titleColor: Color.blueGrey.base)
        btn3.pulseAnimation = .none
        btn3.tag = 3
        buttons.append(btn3)
        
//        let btn4 = FlatButton(title: "Grid", titleColor: Color.blueGrey.base)
//        btn4.pulseAnimation = .none
//        btn4.tag = 4
//        buttons.append(btn4)

        let btn5 = FlatButton(title: "Main", titleColor: Color.blueGrey.base)
        btn5.pulseAnimation = .none
        btn5.tag = 5
        buttons.append(btn5)
    }
    
    fileprivate func prepareTabBar() {
        tabBar = TabBar()
        tabBar.delegate = self
        
        tabBar.dividerColor = Color.grey.lighten3
        tabBar.dividerAlignment = .top
        
        tabBar.lineColor = Color.blue.base
        tabBar.lineAlignment = .top
        
        tabBar.backgroundColor = Color.grey.lighten5
        tabBar.buttons = buttons
        
        view.layout(tabBar).horizontally().bottom()
    }
}

extension RootViewController: TabBarDelegate {
    func tabBar(tabBar: TabBar, willSelect button: UIButton) {
        switch button.tag {
//        case 1:
//            let vc = BarVC()
//            show(vc, sender: nil)
        case 2:
            let vc = TableInCardVC()
            show(vc, sender: nil)
        case 3:
            let vc = CollectionViewVC()
            show(vc, sender: nil)
//        case 4:
//            let vc = GridVC()
//            show(vc, sender: nil)
        case 5:
            let vc = MainVC_CollectionView()
            show(vc, sender: nil)
        default: break
        }
    }
    
    func tabBar(tabBar: TabBar, didSelect button: UIButton) {
        print("did select")
    }
}
