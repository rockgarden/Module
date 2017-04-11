//
//  MainVC_Pan.swift
//  Material
//
//  Created by wangkan on 2017/3/23.
//  Copyright © 2017年 CosmicMind, Inc. All rights reserved.
//

import UIKit
import Material

fileprivate let functionBarHeight: CGFloat = Screen.width/5 + margin * 2
fileprivate let adBarHeight: CGFloat = Screen.width/2
fileprivate let margin: CGFloat = 3

class MainVC_Pan: UIViewController {
    
    fileprivate let headerHeight = adBarHeight + functionBarHeight
    fileprivate let minHeaderHeight = functionBarHeight + 60
    fileprivate let maxHeight = Screen.height - (60 + functionBarHeight)
    fileprivate let minHeight = Screen.height - (adBarHeight + functionBarHeight)
    
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
        v.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: cardCollectionCellReuseId)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    fileprivate var vPan: VertPanGestureRecognizer!
    
    var dataSourceItems = [DataSourceItem]()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        // FIXME: 不能用闭包定义?
        vPan = VertPanGestureRecognizer(target: self, action: #selector(dragging))
        view.addGestureRecognizer(vPan)
        vPan.delegate = self
        
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(mainScrollView)
        view.addSubview(toolBar)
        
        headerView.addSubview(AdBar)
        headerView.addSubview(functionBar)
        
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
    
    /// Pan
    fileprivate var beganConstant:CGFloat = 0.0
    fileprivate var beganOffset:CGFloat = 0.0
    fileprivate var maxOffset: CGFloat = 0.0
    func dragging(_ p: UIPanGestureRecognizer) {
        let v = p.view!
        let sV = v.superview
        
        debugPrint("vPan: superview",sV as Any,"view",v)
        debugPrint("vPan:","sV translation",p.translation(in: sV),"v translation",p.translation(in: v))
        
        let loc = p.location(in: v)
        _ = v.hitTest(loc, with: nil)
        
        let delta = p.translation(in: sV)
        
        let hC = mainScrollView.constraints[0]
        debugPrint(hC)
        
        //        mainScrollView.bounces = (hC.constant >= maxHeight)
        
        switch p.state {
        case .began:
            beganConstant = hC.constant
            beganOffset = mainScrollView.contentOffset.y
            //            if beganConstant < maxHeight && beganOffset <= 0 {
            //                mainScrollView.isScrollEnabled = false
            //            }
            //            if beganConstant < maxHeight && beganOffset > 0 && delta.y <= 0 {
            //                mainScrollView.isScrollEnabled = false
            //            }
        //mainScrollView.contentOffset.y = beganOffset
        case.changed:
            let delta = p.translation(in: v)
            if delta.y > 0 { //向下
                //                if hC.constant >= maxHeight && mainScrollView.contentOffset.y <= 0 {
                //                    mainScrollView.contentOffset.y = max(beganOffset + delta.y, 0)
                //                } else {
                //                    mainScrollView.contentOffset.y = 0
                //                }
                if hC.constant > minHeight {
                    hC.constant = max(beganConstant - delta.y, minHeight)
                }
                else {
                    hC.constant = minHeight
                }
                //                if hC.constant == minHeight {
                //                    mainScrollView.contentOffset.y = min(beganOffset - delta.y - (beganConstant - minHeight), 60)
                //                }
                
                //                if hC.constant == maxHeight {
                //                    mainScrollView.contentOffset.y = beganOffset - delta.y - (maxHeight - beganConstant)
                //                }
                //
                //                if mainScrollView.contentOffset.y <= 0 {
                //                    mainScrollView.contentOffset.y = beganOffset - delta.y + beganOffset
                //                }
                //                if delta.y >= maxOffset {
                //                    maxOffset = delta.y
                //                } else {
                //                    if hC.constant < maxHeight {
                //                        mainScrollView.isScrollEnabled = false
                //                    }
                //                }
            }
            if delta.y < 0 { //向上
                if hC.constant < maxHeight {
                    hC.constant = min(beganConstant - delta.y, maxHeight)
                }
                else {
                    hC.constant = maxHeight
                }
                //                if hC.constant == maxHeight {
                //                    mainScrollView.contentOffset.y = beganOffset - delta.y - (maxHeight - beganConstant)
                //                }
            }
        case .ended:
            let delta = p.translation(in: sV)
            let eC = hC.constant
            //            let eO = mainScrollView.contentOffset.y
            //            debugPrint("",eO)
            //            maxOffset = 0.0
            //            if delta.y < 0 {
            //                if eO > 0 && eC == maxHeight {
            //                    mainScrollView.isScrollEnabled = true
            //                    break
            //                }
            //            }
            
            //            if eO > 0 && eC <= minHeight && delta.y > 0 {
            //                mainScrollView.isScrollEnabled = true
            //                break
        //            }
        default: break
        }
    }
    
}


// MARK: - Add Constraint
fileprivate extension MainVC_Pan {
    
    fileprivate func addConstraint() {
        
        let views = ["tb":toolBar, "ab":AdBar, "hv":headerView, "fb":functionBar, "msv":mainScrollView]
        let metrics = ["hh":headerHeight, "fbh":functionBarHeight, "mh":minHeight]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[hv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[hv]-(0)-[msv]", options: [], metrics: metrics, views: views),
            //NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[hv(hh)]", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[fb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[fb(fbh)]-(0)-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[ab]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[ab]-(0)-[fb]", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[tb]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[tb(60)]", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[msv]-(0)-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[msv(mh)]-(0)-|", options: [], metrics: metrics, views: views),
            //NSLayoutConstraint.constraints(withVisualFormat: "V:[hv]-0-[msv]-(0)-|", options: [], metrics: metrics, views: views),
            ].joined().map{$0})
    }
}


extension MainVC_Pan: CollectionViewDelegate, CollectionViewDataSource {
    
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
extension MainVC_Pan: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let d = adBarHeight - 60
        let minA = CGFloat(0.03)
        let minH = minHeaderHeight
        
        //        if y > 0 {
        //            if y <= d {
        //                let a = (1 - y/d) > minA ? (1 - y/d) : minA
        //                AdBar.alpha = a
        //                //headerView.constraints[0].constant = headerHeight - y
        //            } else {
        //                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: { [weak self] _ in
        //                    self?.AdBar.alpha = minA
        //                    //self?.headerView.constraints[0].constant = minH
        //                    self?.view.updateConstraints()
        //                })
        //            }
        //            view.updateConstraints()
        //        }
    }
    
}


import UIKit.UIGestureRecognizerSubclass

private class VertPanGestureRecognizer: UIPanGestureRecognizer {
    var origLoc: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with e: UIEvent) {
        self.origLoc = touches.first!.location(in: self.view!.superview)
        super.touchesBegan(touches, with: e)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with e: UIEvent) {
        if self.state == .possible {
            let loc = touches.first!.location(in: self.view!.superview)
            let deltaX = fabs(loc.x - self.origLoc.x)
            let deltaY = fabs(loc.y - self.origLoc.y)
            if deltaX >= deltaY {
                self.state = .failed
            }
        }
        super.touchesMoved(touches, with: e)
    }
    
    override func translation(in view: UIView?) -> CGPoint {
        var proposedTranslation = super.translation(in: view)
        proposedTranslation.x = 0
        return proposedTranslation
    }
    
}

extension MainVC_Pan: UIGestureRecognizerDelegate {
    
    /// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let g = gestureRecognizer
        return true
    }
    
    /// 运行一次: 当其中一个手势识别器或其他GestureRecognizer的识别被另一个阻止时调用,返回YES以允许两者同时识别。 默认实现返回NO（默认情况下不会同时识别两个手势）注意：返回YES保证允许同时识别。 返回NO不能保证防止同时识别，因为另一个手势的委托可能返回YES
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if mainScrollView.constraints[0].constant == minHeight || mainScrollView.constraints[0].constant == maxHeight {
            return false
        }
        return true
    }
    
    
    // called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
    // return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
    //
    // note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
//    @available(iOS 7.0, *)
//    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return false
//    }
//    
//    @available(iOS 7.0, *)
//    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return false
//    }
    
    
    /// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch.触摸可以返回YES或NO，以允许/阻止平移手势接收触摸。
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //CGPoint velocity = [gestureRecognizer velocityInView:yourView];
        let vT = touch.view
        let vG = gestureRecognizer.view
        guard let pan = gestureRecognizer as? VertPanGestureRecognizer else {return true}
        if vG === mainScrollView { }
        let movePoint = pan.translation(in: vG)
        let velocity = pan.velocity(in: vG)
        
        if(velocity.x > 0) {
            return false //("gesture went right")
        }
        else if (velocity.x < 0) {
            return false //("gesture went left")
        }
        if (velocity.y > 0 && mainScrollView.contentOffset.y > 0) {
            return false //("gesture went down")
        }
        else if (velocity.y < 0) && mainScrollView.constraints[0].constant == maxHeight {
            return false //("gesture went up")
        }
        return true
    }
    
    
    /// called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
//    @available(iOS 9.0, *)
//    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
//        return true
//    }
    
}
