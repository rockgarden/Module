//
//  AppDelegate.swift
//  Sample
//
//  Created by wangkan on 2017/4/11.
//  Copyright © 2017年 rockgarden. All rights reserved.
//

import UIKit
import Material
import Graph

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let appPageTabBarController = AppPageTabBarController(viewControllers: [ImageCardVC(), PresenterCardVC(), LayerVC()], selectedIndex: 0)

        let appBottomNavigationController = AppBottomNavigationController(viewControllers: [CloudVC(), TextFieldVC(), ButtonVC(), WatchVC(), RemindersViewController(), CardVC()])

        let appNavigationController = AppNavigationController(rootViewController: NavVC())

        let appSnackbarController = AppSnackbarController(rootViewController: SnackbarVC())

        let appSearchBarController = AppSearchBarController(rootViewController: SearchVC())

        if !UIDevice.isSimulator() {
            let appCaptureController = AppCaptureController(rootViewController: CaptureVC())
        }

        let leftViewController = LeftViewController()
        let rightViewController = RightViewController()
        let appToolbarController = AppToolbarController(rootViewController: RootViewController())
        let appNavigationDrawerController = AppNavigationDrawerController(rootViewController: appToolbarController, leftViewController: leftViewController, rightViewController: rightViewController)

        let photoLibraryVC = AppToolbarController(rootViewController: PhotoLibraryViewController())
        let photoVC = AppNavigationController(rootViewController: PhotoCollectionViewController())

        let appDC = DrawerController()
        appDC.setViewController(UITabBarVC(), side: .none)
        appDC.setViewController(LeftViewController(), side: .left)
        appDC.setAnimator(animator: DrawerSpringAnimator(), side: .left)
        appDC.setTransition(transition: DrawerFloatTransition(), side: .left)
        appDC.setOverflowTransition(transition: DrawerFloatTransition(), side: .left)

        SampleData_Card.createSampleData()
        let graph = Graph()
        let search = Search<Entity>(graph: graph).for(types: "Category")
        var viewControllers = [PostsViewController]()
        for category in search.sync() {
            if let name = category["name"] as? String {
                viewControllers.append(PostsViewController(category: name))
            }
        }
        let pageTabBarController = AppPageTabBarController(viewControllers: viewControllers)
        let toolbarController = AppToolbarController(rootViewController: pageTabBarController)
        let menuController = AppFABMenuController(rootViewController: toolbarController)

        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = appDC
        window!.makeKeyAndVisible()

        return true
    }

}

public extension UIDevice {
    // MARK: - Class functions -

    /**
     Returns the device platform string
     Example: "iPhone7,2"

     - returns: Returns the device platform string
     */
    public static func devicePlatform() -> String {
        var name: [Int32] = [CTL_HW, HW_MACHINE]
        var size: Int = 2
        sysctl(&name, 2, nil, &size, &name, 0)
        var hw_machine = [CChar](repeating: 0, count: Int(size))
        sysctl(&name, 2, &hw_machine, &size, &name, 0)

        let hardware = String(cString: hw_machine)
        return hardware
    }

    public static func isSimulator() -> Bool {
        if self.devicePlatform() == "i386" || self.devicePlatform() == "x86_64" {
            return true
        } else {
            return false
        }
    }
    
}
