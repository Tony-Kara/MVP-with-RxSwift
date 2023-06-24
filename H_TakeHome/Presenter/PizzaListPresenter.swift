
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation

protocol PizzaListViewPresenter: AnyObject {
    init(view: PizzaListView)
    func viewDidLoad()
    func loadBannerImage(with url: URL)
}


final class PizzaListPresenter: PizzaListViewPresenter {
   
    
    
    //MARK: - Private properties
    
    private weak var view: PizzaListView?
     let apiService: ApiNetworkingService!
 
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
    }
    
    func loadBannerImage(with url: URL) {
        apiService.getImage(url: url) { bannerImage in
            self.view?.getBannerImage(bannerImage)
        }
    }
    
}
