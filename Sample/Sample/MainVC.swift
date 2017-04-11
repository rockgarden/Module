//
//  MainVC.swift
//  ICSLA
//
//  Created by wangkan on 2017/3/8.
//  Copyright © 2017年 eastcom. All rights reserved.
//  首页

import UIKit
import Material

fileprivate let functionBarHeight: CGFloat = Screen.width/5 + margin * 2
fileprivate let adBarHeight: CGFloat = Screen.width/2
fileprivate let margin: CGFloat = 3
fileprivate let columns: CGFloat = .phone == Device.userInterfaceIdiom ? 4 : 11

class MainVC: UIViewController, UIGestureRecognizerDelegate {
    
    fileprivate let headerHeight = adBarHeight + functionBarHeight

    let w: CGFloat = (Screen.width - columns - 1) / columns

    lazy fileprivate var headerView: UIView = {
        let v = UIView()
        v.backgroundColor = Color.lightBlue.base
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy fileprivate var AdBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy fileprivate var functionBar: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var toolBar: UIView = {
        let v = UIView()
        v.backgroundColor = Color.clear
        let moreB = IconButton(image: Icon.cm.moreHorizontal, tintColor: Color.white)
        moreB.pulseColor = Color.blue.darken2
        moreB.pulseAnimation = .centerWithBacking
        moreB.addTarget(nil, action: #selector(close), for: .touchUpInside)
        v.layout(moreB).width(60).height(40).bottomLeft()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var mainScrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .gray
        v.delegate = self
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var mainSubView: CollectionView = {
        let v = CollectionView()
        v.isScrollEnabled = false
        v.delegate = self
        v.dataSource = self
        v.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: cardCollectionCellReuseId)
        v.translatesAutoresizingMaskIntoConstraints = true
        return v
    }()

    var dataSourceItems = [DataSourceItem]()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(mainScrollView)
        view.addSubview(toolBar)
        
        headerView.addSubview(AdBar)
        headerView.addSubview(functionBar)
        mainScrollView.addSubview(mainSubView)

        addConstraint()
        
        mainSubView.frame = CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height - headerHeight)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareDataSourceItems()
        mainSubView.reloadData()
        (mainSubView.collectionViewLayout as! CollectionViewLayout).returnContentSize = { [weak self] contentSize in
            guard let weak = self else {return}
            weak.updateContentSize(size: contentSize)
        }        
    }

    @objc fileprivate func close() {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func prepareDataSourceItems() {
        let data = ["meditation", "yoga", "surf"]
        
        data.forEach { [unowned self, w = view.bounds.width] (item) in
            let card = Card()
            let imageView = UIImageView()
            imageView.image = UIImage(named: item)?.resize(toWidth: w)
            imageView.contentMode = .scaleAspectFit
            card.contentView = imageView
            self.dataSourceItems.append(DataSourceItem(data: card, height: card.height))
        }
        debugPrint(dataSourceItems)
    }

    fileprivate func updateContentSize(size: CGSize) {
        mainScrollView.contentSize = size
        var newframe = mainSubView.frame
        newframe.size.height = size.height
        mainSubView.frame = newframe
    }

}


// MARK: - Add Constraint
fileprivate extension MainVC {
    
    fileprivate func addConstraint() {
        
        let views = ["tb":toolBar, "ab":AdBar, "hv":headerView, "fb":functionBar, "msv":mainScrollView]
        let metrics = ["hh":headerHeight, "fbh":functionBarHeight]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[hv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[hv(hh)]", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[fb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[fb(fbh)]-(0)-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[ab]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[ab]-(0)-[fb]", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[tb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[tb(60)]", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[msv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[hv]-(0)-[msv]-(0)-|", options: [], metrics: nil, views: views),
            ].joined().map{$0})
    }
}


extension MainVC: CollectionViewDelegate, CollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCollectionCellReuseId, for: indexPath) as! CardCollectionViewCell
        let dataSourceItem = dataSourceItems[indexPath.item]
        let card = dataSourceItem.data as! Card
        cell.card = card
        return cell
    }
}


// MARK: - UIScrollViewDelegate
extension MainVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let y = scrollView.contentOffset.y
        let d = adBarHeight - 60
        let tC = headerHeight - d
        let mA = CGFloat(0.03)
        let oH = mainSubView.bounds.height
        
        //if headerView.constraints[0].constant > tC { }
        guard scrollView !== CollectionView.self else {return}
        if y > 0 {
            if y <= d {
                let a = (1 - y/d) > mA ? (1 - y/d) : mA
                AdBar.alpha = a
                headerView.constraints[0].constant = headerHeight - y
                //mainSubView.frame = CGRect(x: 0, y: 0, width: Screen.width, height: oH + y)
            } else {
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: { [weak self] _ in
                    self?.AdBar.alpha = mA
                    self?.headerView.constraints[0].constant = tC
                    self?.view.updateConstraints()
                    //self?.mainSubView.frame = CGRect(x: 0, y: 0, width: Screen.width, height: oH + d)
                })
            }
            view.updateConstraints()
        }
    }

}
