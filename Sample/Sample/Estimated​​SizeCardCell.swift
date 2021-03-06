//
//  Estimated​​SizeCardCell.swift
//  Material
//
//  Created by wangkan on 2017/3/27.
//  Copyright © 2017年 CosmicMind, Inc. All rights reserved.
//

import UIKit
import Material
import Graph

let Estimated​​SizeCardCellReuseId = "Estimated​​SizeCardCell"

class Estimated​​SizeCardCell: UICollectionViewCell {

    /// A boolean that indicates whether the cell is the last cell.
    public var isLast = false

    public lazy var card: PresenterCard = PresenterCard()

    fileprivate var placeHolderImage = UIImage(named: "CosmicMind")

    /// Toolbar views.
    private var toolbar: Toolbar!
    private var moreButton: IconButton!

    /// Image area.
    private var imageView: UIImageView!

    /// Content area.
    private var contentLabel: UILabel!

    /// Bottom Bar views.
    private var bottomBar: Bar!
    private var dateFormatter: DateFormatter!
    private var dateLabel: UILabel!
    private var favoriteButton: IconButton!
    private var shareButton: IconButton!

    public var data: Entity? {
        didSet {
//            layoutSubviews()
            guard let d = data else {
                return
            }

            toolbar.title = d["title"] as? String
            let s = d["detail"] as? String
            toolbar.detail = s! + "注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。)"

            if let image = d["photo"] as? UIImage {
                imageView.height = image.height
                DispatchQueue.main.async { [weak self, image = image] in
                    self?.imageView.image = image
                }
            }

            let c = d["content"] as? String
            contentLabel.text = c! + "注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。)"

            dateLabel.text = dateFormatter.string(from: d.createdDate)

            //        card.x = 0
            //        card.y = 0
            //        card.width = Screen.width
            //        // TODO: 奇怪的 height
            //        card.height = height
            //        
            card.setNeedsLayout()
            card.layoutIfNeeded()

        }
    }

    /// Calculating dynamic height.
//    open override var height: CGFloat {
//        get {
//            return card.height
//        }
//        set(value) {
//            super.height = value
//        }
//    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        guard let d = data else {
//            return
//        }
//
//        toolbar.title = d["title"] as? String
//        let s = d["detail"] as? String
//        toolbar.detail = s! + "注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。)"
//
//        if let image = d["photo"] as? UIImage {
//            imageView.height = image.height
//            DispatchQueue.main.async { [weak self, image = image] in
//                self?.imageView.image = image
//            }
//        }
//
//        let c = d["content"] as? String
//        contentLabel.text = c! + "注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。), 注意： 不要在 xib 或者 Storyboard 给控件添加约束，因为这样添加上 top 和 left 会直接添加到 cell 上，而不是cell.contentView 上。(如果你是纯代码选手，请忽视这一点。)"
//
//        dateLabel.text = dateFormatter.string(from: d.createdDate)
//
//        card.x = 0
//        card.y = 0
//        card.width = Screen.width
//        // TODO: 奇怪的 height
//        card.height = height
//        
//        card.setNeedsLayout()
//        card.layoutIfNeeded()

//        debugPrint("card.frame and cell.frame", card.frame, frame)
//        var cf = contentView.frame
//        cf.size = card.frame.size
//        contentView.frame = cf
//        
//        var f = frame
//        f.size = cf.size
//        frame = f
//        
//        debugPrint("card.frame and cell.frame", card.frame, frame)
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        /// Rasterize the cells for performance
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 0
        layer.masksToBounds = true
        clipsToBounds = true
        backgroundColor = UIColor.white

        prepare()
    }

    func prepare() {
        //super.prepare()

//        layer.rasterizationScale = Screen.scale
//        layer.shouldRasterize = true

        //pulseAnimation = .none
        backgroundColor = nil

        prepareDateFormatter()
        prepareDateLabel()
        prepareMoreButton()
        prepareToolbar()
        prepareCloseButton()
        prepareCheckButton()
        preparePresenterImageView()
        prepareContentLabel()
        prepareBottomBar()

        prepareCard()
    }

    private func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }

    private func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.blueGrey.base
        dateLabel.textAlignment = .center
    }

    private func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.blueGrey.base)
    }

    private func prepareCloseButton() {
        favoriteButton = IconButton(image: Icon.cm.close, tintColor: Color.red.base)
    }

    private func prepareCheckButton() {
        shareButton = IconButton(image: Icon.cm.check, tintColor: Color.blueGrey.base)
    }

    private func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.heightPreset = .xlarge
        toolbar.contentEdgeInsetsPreset = .square3
        toolbar.titleLabel.textAlignment = .left
        toolbar.detailLabel.textAlignment = .left
        toolbar.rightViews = [moreButton]
        toolbar.dividerColor = Color.grey.lighten3
        toolbar.dividerAlignment = .top
    }

    private func preparePresenterImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
    }

    private func prepareContentLabel() {
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.font = RobotoFont.regular(with: 14)
    }

    private func prepareBottomBar() {
        bottomBar = Bar()
        bottomBar.heightPreset = .xlarge
        bottomBar.contentEdgeInsetsPreset = .square3
        bottomBar.centerViews = [dateLabel]
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [shareButton]
        bottomBar.dividerColor = Color.grey.lighten3
    }

    private func prepareCard() {
        card.toolbar = toolbar
        card.presenterView = imageView
        card.contentView = contentLabel
        card.contentViewEdgeInsetsPreset = .square3
        card.contentViewEdgeInsets.bottom = 0
        card.bottomBar = bottomBar
        card.depthPreset = .none

        contentView.addSubview(card)
        /// 必须执行, 这样才可在首次加载时
        layout.vertically().edges()
    }

}

