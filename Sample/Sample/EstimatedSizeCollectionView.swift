//
//  EstimatedSizeCollectionView.swift
//  Material
//
//  Created by wangkan on 2017/3/27.
//  Copyright © 2017年 CosmicMind, Inc. All rights reserved.
//

import UIKit
import Graph

class EstimatedSizeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    internal lazy var heights = [IndexPath: CGFloat]()

    public var data = [Entity]() {
        didSet {
            reloadData()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    public init(frame: CGRect) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        translatesAutoresizingMaskIntoConstraints = false
        prepare()
    }

    public convenience init() {
        self.init(frame: .zero)
        prepare()
    }

    open func prepare() {
        dataSource = self
        delegate = self
        backgroundColor = .black
        register(Estimated​​SizeCardCell.self, forCellWithReuseIdentifier: Estimated​​SizeCardCellReuseId)

        let flow = collectionViewLayout as! UICollectionViewFlowLayout
        /// FIXME: 无法使用 estimatedItemSize
        //flow.itemSize = CGSize(width:self.frame.width, height:100)
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 10
        flow.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        debugPrint(collectionView.contentSize)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Estimated​​SizeCardCellReuseId, for: indexPath) as! Estimated​​SizeCardCell
        cell.data = data[indexPath.row]
        
        /// 不需要, 在 cell class 中完成
        //cell.setNeedsLayout()
        //cell.layoutIfNeeded()
        
        heights[indexPath] = cell.card.height
        
        return cell
    }
}


extension EstimatedSizeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        debugPrint(heights[indexPath] as Any)
        return CGSize(width: self.frame.width, height: heights[indexPath] ?? height)
    }
}
