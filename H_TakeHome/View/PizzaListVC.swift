
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
    func getBannerImage(_ image: UIImage)
}

final class PizzaListVC: UIViewController {

    //MARK: - Private properties
   
   private let rootView = PizzaListHomeView()
   
   private var menuItemsData = BehaviorRelay<[MenuItem]>(value:[])
   private var bannerImages =  BehaviorRelay<[UIImage?]>(value: [UIImage(named: "Banner1"), UIImage(named: "Banner2"), UIImage(named: "Banner3")] )
   private let disposeBag = DisposeBag()
    
    //MARK: - Public properties
    
   var presenter: PizzaListViewPresenter!
    
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
        bindPresenter()
        
       
      
    }
    //MARK: - Private Functions
    
    private func bindPresenter() {

            self.bannerImages
                .bind(to: self.rootView.bannerViewCollectionView.rx.items(AdvertisementBannerCollectionCell.self)) { _, model, cell in
                    
                    
                    cell.set(image: model ?? UIImage())
                    
//                    if let imageUrl = model.image {
//                    self.presenter.loadBannerImage(with: imageUrl)
//                        self.bannerImages
//                            .subscribe(onNext: { image in
//                                if let image = image {
//                                    cell.set(image: image)
//                                }
//
//                            }).disposed(by: self.disposeBag)
//
//                                   }
                    print("1111-4", model)
                    
                }.disposed(by: self.disposeBag)
    }
    
}

extension PizzaListVC: PizzaListView {
    func getBannerImage(_ image: UIImage) {
      //  bannerImages.accept(image)
      
    }
    
    func getMenuItems(_ menuItems: [MenuItem]) {
        menuItemsData.accept(menuItems)
    }
    
    
}
