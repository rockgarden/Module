//
//  AppDelegate.swift
//  SignDemo
//
//  Created by wangkan on 2017/10/31.
//  Copyright © 2017年 rockgarden. All rights reserved.
//

import UIKit
import Sign

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)

//        NSString *path = [[NSBundle mainBundle] pathForResource:@"TempFramework" ofType:@"framework"];
//        NSLog(@"path = %@", path);
//
//        NSBundle *myBundle = [NSBundle bundleWithPath:path];
//        NSLog(@"myBunlde = %@", myBundle);
//
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BasicMain" bundle:myBundle];
//        NSLog(@"%@", storyboard);

        let stor = UIStoryboard.init(name: "SignVC", bundle: nil)
        let vac = stor.instantiateViewController(withIdentifier: "SignVC")
        let nav = UINavigationController.init(rootViewController: vac)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }

}

