//
//  CustomNavigationBarTests.swift
//  CustomNavigationBarTests
//
//  Created by RODRIGO FRANCISCO PABLO on 01/01/25.
//

import XCTest
@testable import CustomNavigationBard

final class CustomNavigationBarTests: XCTestCase {
    override func setUp() {
        NavigationBarTopViewProvider.shared = NavigationBarTopViewProvider(allowedScreens: [MainViewController.self])
    }
    
    override func tearDown() {
        NavigationBarTopViewProvider.shared = NavigationBarTopViewProvider()
    }
    
    func test_navigationBarTopView_presentOnValidScreen_succeds() {
        let vc = MainViewController()
        let appController = UINavigationController(rootViewController: vc)
        
        vc.becomeVisible()
        
        XCTAssertTrue(appController.topViewController?.isTopViewVisible() ?? false)
    }
    
    func test_navigationBarTopView_presentOnInvalidScreen_fails() {
        let vc = SecondaryViewController()
        let appController = UINavigationController(rootViewController: vc)
        
        vc.becomeVisible()
        
        XCTAssertFalse(appController.topViewController?.isTopViewVisible() ?? true)
    }
    
    func test_navigationBarTop_isHidenWhenCallingHidenAPI() {
        let vc = MainViewController()
        let appController = UINavigationController(rootViewController: vc)
        
        vc.becomeVisible()
        vc.navigationController?.navbarCustomTopView(.hide)
        
        XCTAssertFalse(appController.topViewController?.isTopViewVisible() ?? true)
    }
}

private extension UIViewController {
    func becomeVisible() {
        self.loadViewIfNeeded()
        self.navigationController?.navbarCustomTopView(.show)
    }
    
    func isTopViewVisible() -> Bool {
        let topViewReference = NavigationBarTopViewProvider.shared.topView
        return self.navigationController?.view.subviews.contains(topViewReference) ?? false
    }
}
