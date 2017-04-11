//
//  MainVC_CollectionView.swift
//  Material
//
//  Created by wangkan on 2017/3/23.
//  Copyright © 2017年 CosmicMind, Inc. All rights reserved.
//

import UIKit
import Material

fileprivate let functionBarHeight: CGFloat = Screen.width/5 + margin * 2
fileprivate let adBarHeight: CGFloat = Screen.width/2
fileprivate let toolBarHeight: CGFloat = 60
fileprivate let margin: CGFloat = 3
fileprivate let headerHeight = adBarHeight + functionBarHeight
fileprivate let minHeaderHeight = functionBarHeight + toolBarHeight
fileprivate let insetDistance: CGFloat = headerHeight - toolBarHeight

class MainVC_CollectionView: UIViewController {

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

    lazy var mainScrollView: CollectionView = {
        let v = CollectionView()
        v.backgroundColor = .gray
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.isScrollEnabled = true
        v.delegate = self
        v.dataSource = self
        v.contentInset = UIEdgeInsetsMake(insetDistance, 0, 0, 0)
        v.scrollIndicatorInsets = UIEdgeInsetsMake(insetDistance, 0, 0, 0)
        v.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: cardCollectionCellReuseId)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var dataSourceItems = [DataSourceItem]()

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        view.backgroundColor = .white

        view.addSubview(mainScrollView)
        headerView.addSubview(AdBar)
        headerView.addSubview(functionBar)
        view.addSubview(headerView)
        view.addSubview(toolBar)

        addConstraint()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareDataSourceItems()
        mainScrollView.reloadData()
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

}


// MARK: - Add Constraint
fileprivate extension MainVC_CollectionView {

    fileprivate func addConstraint() {

        let views = ["tb":toolBar, "ab":AdBar, "hv":headerView, "fb":functionBar, "msv":mainScrollView]
        let metrics = ["hh":headerHeight, "fbh":functionBarHeight, "th":toolBarHeight]

        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[hv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[hv(hh)]", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[fb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[fb(fbh)]-(0)-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[ab]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[ab]-(0)-[fb]", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[tb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[tb(th)]", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[msv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[tb]-0-[msv]-(0)-|", options: [], metrics: metrics, views: views),
            ].joined().map{$0})
    }
}


extension MainVC_CollectionView: CollectionViewDelegate, CollectionViewDataSource {

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
extension MainVC_CollectionView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let minA = CGFloat(0.03)
        let dY = scrollView.contentOffset.y + insetDistance

        if dY <= 0 {
            headerView.constraints[0].constant = headerHeight
            AdBar.alpha = minA
            view.updateConstraints()
        } else {
            headerView.constraints[0].constant = max(headerHeight - dY,minHeaderHeight)
            if headerView.constraints[0].constant > minHeaderHeight {
                AdBar.alpha = max((dY)/insetDistance, minA)
                view.updateConstraints()
            } else {
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: { [weak self] _ in
                    self?.AdBar.alpha = minA
                    self?.view.updateConstraints()
                })
            }
        }
    }

}
