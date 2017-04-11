//
//  AppAnimatedTabBarController.swift
//  Material
//
//  Created by wangkan on 2017/3/8.
//  Copyright © 2017年 CosmicMind, Inc. All rights reserved.
//

import UIKit
import Material

class AppAnimatedTabBarController: AnimatedTabBarController {
    
    var vcs = [CloudVC(), WatchVC()]
    
    override func viewDidLoad() {
        
        var navArray = [UIViewController]()
        for vc in vcs {
            let vc = vc
            let atbi = AnimatedTabBarItem()
            atbi.image = Icon.cm.share?.tint(with: Color.blueGrey.base)
            atbi.selectedImage = Icon.cm.share?.tint(with: Color.blue.base)
            atbi.animation = FumeAnimation()
            vc.tabBarItem = atbi
            navArray.append(vc)
        }
        self.viewControllers = navArray
        
        super.viewDidLoad()
    }
}
