//
//  BaseTabBarController.swift
//  ICSLA
//
//  Created by JarlRyan on 14/7/25.
//  Refactor by Wangkan on 16/8/30
//  Copyright (c) 2014年 eastcom. All rights reserved.
//

import UIKit
import Material

/// Other VC 执行 selectedIndex
protocol RootTabBarViewControllerDelegate: class {
    func selectedVCforRootTab(_ vcTitle: String)
}

/// 根视图控制器 noMoreNVC
class UITabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = loadDefaultVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }


    fileprivate func loadDefaultVC() -> [UIViewController] {
        let main = MainVC()
        main.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "cm_photo_camera_white"), selectedImage: UIImage(named: "cm_photo_camera_white"))
        let n_Main = UINavigationController(rootViewController: main)
        let my = PhotoCollectionViewController()
        my.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "cm_photo_library_white"), selectedImage: UIImage(named: "cm_photo_library_white"))
        let n_My = UINavigationController(rootViewController: my)
        return [n_Main,n_My]
    }

    
}

