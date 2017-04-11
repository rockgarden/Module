

import UIKit
import Material
import Graph

class PostsViewController: UIViewController {
    internal var category: String
    
    /// Model.
    internal var graph: Graph!
    internal var search: Search<Entity>!
    
    internal var data: [Entity] {
        guard let category = search.sync().first else {
            return [Entity]()
        }
        
        let posts = category.relationship(types: "Post").subject(types: "Article")
        
        return posts.sorted { (a, b) -> Bool in
            return a.createdDate < b.createdDate
        }
    }
    
    /// View.
    internal var tableView: CardTableView!
    internal var collectionView: EstimatedSizeCollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        category = ""
        super.init(coder: aDecoder)
        preparePageTabBarItem()
    }
    
    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        preparePageTabBarItem()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.lighten5
        
        // Model.
        prepareGraph()
        prepareSearch()
        
        /// Code Init 不采用
        //automaticallyAdjustsScrollViewInsets = false
        
        // Feed.
        prepareTableView()
        prepareCollectionView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
}

/// Model.
extension PostsViewController {
    internal func prepareGraph() {
        graph = Graph()
    }
    
    internal func prepareSearch() {
        search = Search<Entity>(graph: graph).for(types: "Category").where(properties: ("name", category))
    }
}

/// PageTabBar.
extension PostsViewController {
    internal func preparePageTabBarItem() {
        pageTabBarItem.title = category
        pageTabBarItem.titleColor = .white
    }
}

/// TableView.
extension PostsViewController {
    internal func prepareTableView() {
        tableView = CardTableView()
        //view.layout(tableView).edges()
    }

    internal func prepareCollectionView() {
        collectionView = EstimatedSizeCollectionView()
        view.layout(collectionView).edges()
    }
    
    internal func reloadData() {
        guard let toolbar = toolbarController?.toolbar else {
            return
        }
        //tableView.data = data
        collectionView.data = data
        toolbar.detail = "\(tableView.data.count) " + (1 == tableView.data.count ? "Article" : "Articles")
    }
}
