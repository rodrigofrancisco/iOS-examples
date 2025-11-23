//
//  AppComposition.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 28/11/24.
//

import UIKit

extension SceneDelegate {
    func makeMainApp() -> UIViewController {
        let tabBarController = makeTabbar()
        let viewControllerOne = makeHome()
        let viewControllerTwo = makeOtherView()
        tabBarController.viewControllers = [viewControllerOne, viewControllerTwo]
        
        return tabBarController
    }
    
    private func makeTabbar() -> UITabBarController {
        let tabBarController = UITabBarController()
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.5)
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .regular)
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        return tabBarController
    }
    
    private func makeHome() -> UIViewController {
        let vc = MainViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        return UINavigationController(rootViewController: vc)
    }
    
    private func makeOtherView() -> UIViewController {
        let vc = SecondaryViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Other",
            image: UIImage(systemName: "book.pages"),
            tag: 1
        )
        return UINavigationController(rootViewController: vc)
    }
}
