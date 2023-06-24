
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation
import RxRelay
import UIKit

enum MenuCategory: String, CaseIterable {
    case Пицца, Комбо, Десерты, Напитки, другие
}

protocol PizzaListViewPresenter: AnyObject {
    init(view: PizzaListView)
    func viewDidLoad()
    func loadBannerImage(with url: URL)
    var bannerImages: BehaviorRelay<[UIImage?]> { get }
    var menuCategory: BehaviorRelay<[MenuCategory]> { get }
}


final class PizzaListPresenter: PizzaListViewPresenter {
    
    
    
    
    
    
    
    
   // var menuCategory: [Category] = [Category]()
    
    
    
   
    
    
    //MARK: - Private properties
    
    private weak var view: PizzaListView?
     let apiService: ApiNetworkingService!
    
    //MARK: - Public properties
    
     var menuCategoryAll: [MenuCategory] = MenuCategory.allCases
     var bannerImages =  BehaviorRelay<[UIImage?]>(value: [UIImage(named: "Banner1"), UIImage(named: "Banner2"), UIImage(named: "Banner3")])
     var menuCategory =  BehaviorRelay<[MenuCategory]>(value: [])
     
 
    //MARK: - Init
    
    required init(view: PizzaListView) {
        self.view = view
        self.apiService = ApiService()
        
    }
    
    // MARK: - Protocol methods
    
    func viewDidLoad() {
        apiService.getMenu { [weak self] menuItems in
            self?.view?.getMenuItems(menuItems)
        }
        menuCategory.accept(menuCategoryAll)
    }
    
    func loadBannerImage(with url: URL) {
        apiService.getImage(url: url) { bannerImage in
            self.view?.getProductImage(bannerImage)
        }
    }
    
    
 
    
    
}
