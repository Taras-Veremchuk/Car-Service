//
//  MainTabBarController.swift
//  Car-Service
//
//  Created by Taras Veremchuk on 13.03.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    let catalogVC = CarsCatalogController()
//    let cartVC = CartController()

    override func viewDidLoad() {
        super.viewDidLoad()

        catalogVC.tabBarItem = .init(
            title: "Katalog", image: UIImage(systemName: "car"), tag: 1)
//        cartVC.tabBarItem = .init(
//            title: "Bin", image: UIImage(systemName: "cart"), tag: 2)

//        catalogVC.cart = cartVC

        viewControllers = [
            UINavigationController(rootViewController: catalogVC),
//            UINavigationController(rootViewController: cartVC),
        ]
        tabBarController?.tabBar.backgroundColor = .white
    }

}
