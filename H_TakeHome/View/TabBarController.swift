//
//  TabBarController.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        setUpTabBarItems()
    }
    
    private func  setUpTabBarItems() {
        let pizzalistVC = PizzaListVC()
        let pizzaListPresenter = PizzaListPresenter(view: pizzalistVC)
        pizzalistVC.presenter = pizzaListPresenter
        pizzalistVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "1.circle"), tag: 0)
        
        
        
        let profileInfoVC = ProfileInfoVC()
        let profileInfoPresenter = ProfileInfoPresenter(view: profileInfoVC)
        profileInfoVC.presenter = profileInfoPresenter
        profileInfoVC.tabBarItem = UITabBarItem(title: "Пофиль", image: UIImage(systemName: "1.circle"), tag: 1)
        
        let pizzaListNavVC = UINavigationController(rootViewController: pizzalistVC)
        let profileInfoNavVC = UINavigationController(rootViewController: profileInfoVC)
        
        setViewControllers([pizzaListNavVC,profileInfoNavVC], animated: false)
    }
    
    
    
}


