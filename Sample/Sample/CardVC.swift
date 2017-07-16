
import UIKit
import Material

class CardVC: UIViewController {
    
    fileprivate var card: Card!
    
    fileprivate var toolbar: Toolbar!
    fileprivate var moreButton: IconButton!
    
    fileprivate var contentView: UILabel!
    
    fileprivate var bottomBar: Bar!
    fileprivate var dateFormatter: DateFormatter!
    fileprivate var dateLabel: UILabel!
    fileprivate var favoriteButton: IconButton!
    
//    convenience init() {
//        self.init(nibName: nil, bundle: nil)
//        prepareTabBarItem()
//    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.base
        
        prepareDateFormatter()
        prepareDateLabel()
        prepareFavoriteButton()
        prepareMoreButton()
        prepareToolbar()
        prepareContentView()
        prepareBottomBar()
        prepareImageCard()
    }
}

extension CardVC {
    
    fileprivate func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    fileprivate func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.grey.base
        dateLabel.text = dateFormatter.string(from: Date.distantFuture)
    }
    
    fileprivate func prepareFavoriteButton() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    
    fileprivate func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreHorizontal, tintColor: Color.grey.base)
    }
    
    fileprivate func prepareToolbar() {
        toolbar = Toolbar(rightViews: [moreButton])
        
//        toolbar.title = "Material"
        toolbar.titleLabel.textAlignment = .left
        toolbar.heightPreset = .xlarge
//        toolbar.detail = "Build Beautiful Software"
        toolbar.interimSpacePreset = .interimSpace10
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.grey.base
        toolbar.dividerColor = Color.grey.lighten3
        toolbar.dividerAlignment = .top
        toolbar.dividerContentEdgeInsetsPreset = .horizontally2
    }
    
    fileprivate func prepareContentView() {
        contentView = UILabel()
        contentView.numberOfLines = 0
//        contentView.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentView.font = RobotoFont.regular(with: 14)
    }
    
    fileprivate func prepareBottomBar() {
        bottomBar = Bar()
        
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [dateLabel]
    }
    
    fileprivate func prepareImageCard() {
        card = Card()
//        toolbar.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 0
        card.toolbarEdgeInsets.right = 8
        
        card.contentView = contentView
        card.contentViewEdgeInsetsPreset = .wideRectangle3
        
        card.bottomBar = bottomBar
        card.bottomBarEdgeInsetsPreset = .wideRectangle2
        debugPrint(card.frame)
        print(view)
        view.layout(card).horizontally(left: 20, right: 20).center()
        debugPrint(card.frame)
    }

    fileprivate func prepareTabBarItem() {
        tabBarItem.image = Icon.cm.search?.tint(with: Color.blueGrey.base)
        tabBarItem.selectedImage = Icon.cm.search?.tint(with: Color.blue.base)
    }
}
