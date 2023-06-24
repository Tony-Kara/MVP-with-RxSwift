
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation
import UIKit
import RxSwift
import RxRelay


protocol PizzaListView: AnyObject {
    func getMenuItems(_ menuItems : [MenuItem])
}

final class PizzaListVC: UIViewController {

    //MARK: - Private properties
    
   private let rootView = PizzaListHomeView()
   private var menuItemsData = BehaviorRelay<[MenuItem]>(value:[])
   private let disposeBag = DisposeBag()
  
    
    
   //MARK: - Init and Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        rootView.bannerViewCollectionView.registerClassForCell(AdvertisementBannerCollectionCell.self)
        rootView.menuCatergoryCollectionView.registerClassForCell(MenuCatergoryCell.self)
        
        menuItemsData.subscribe(onNext: { menuItemsData in
            print("1111-1", menuItemsData)
        })
      
    }
    var presenter: PizzaListViewPresenter!
}

extension PizzaListVC: PizzaListView {
    func getMenuItems(_ menuItems: [MenuItem]) {
        menuItemsData.accept(menuItems)
    }
    
    
}
