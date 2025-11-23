//
//  UIViewController+AddNavBarTopItem.swift
//  CustomNavigationBard
//
//  Created by RODRIGO FRANCISCO PABLO on 28/11/24.
//

import UIKit

protocol TopNavigationRenderable {
    var topView: UIView { get }
    var additionalSpace: CGFloat { get }
}

extension UINavigationController {
    enum NavbarTopViewAction {
        case show
        case hide
    }
    
    func navbarTopView(_ action: NavbarTopViewAction, provider: TopNavigationRenderable = StoreSelectorTopView.shared) {
        switch action {
        case .show:
            self.addTopView(
                provider.topView,
                withAdditionalTopSpace: provider.additionalSpace
            )
        case .hide:
            self.removeTopView(
                provider.topView,
                minusAdditionalSpace: provider.additionalSpace
            )
        }
    }
}

// Helper to hide/show to navbar top view and the lower tabbar when scrolling down/up
extension UINavigationController {
    func toggleTopView(baseOn scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if actualPosition.y > 0 {
            // Dragging down
            UIView.animate(withDuration: 2, animations: { [weak self] in
                self?.navbarTopView(.show)
            })
        } else {
            // Dragging up
            UIView.animate(withDuration: 2, animations: { [weak self] in
                self?.navbarTopView(.hide)
            })
        }
    }
}


// Let's make an effort to keep these function private and use the `navbarCustomTopView(.show)` `navbarCustomTopView(.hide)`
// interfaces to show or hide the views
private extension UINavigationController {
    private func addTopView(_ view: UIView, withAdditionalTopSpace additionalSpace: CGFloat) {
        let navigationController = self
        let navigationBarRef = navigationController.navigationBar
        if navigationController.view.subviews.contains(view) { return }
        
        navigationController.additionalSafeAreaInsets.top = additionalSpace
        navigationController.view.addSubview(view)
        view.layer.zPosition = 1
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: navigationBarRef.topAnchor, constant: additionalSpace * -1),
            view.leadingAnchor.constraint(equalTo:  navigationBarRef.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: navigationBarRef.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: additionalSpace)
        ])
    }
    
    private func removeTopView(_ view: UIView, minusAdditionalSpace additionalSpace: CGFloat) {
        let navigationController = self
        view.removeFromSuperview()
        navigationController.additionalSafeAreaInsets.top = additionalSpace * -1
    }
}

extension UINavigationController {
    func addBottomPadding(color: UIColor = .primary500, size: CGFloat = 10) {
        let bottomView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: size))
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = color
        bottomView.layer.zPosition = 1
        self.navigationBar.addSubview(bottomView)
        let navigationBar = self.navigationBar
        
        self.visibleViewController?.additionalSafeAreaInsets = UIEdgeInsets(top: size, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: size)
        ])
    }
}
