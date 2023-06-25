
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
    func getProductImage(_ image: UIImage)
}

final class PizzaListVC: UIViewController {

    //MARK: - Private properties
   
   private let rootView = PizzaListHomeView()
   
   private var menuItemsData = BehaviorRelay<[MenuItem]>(value:[])
   private var productImage = BehaviorRelay<UIImage?>(value: nil)
  
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
        rootView.tableView.registerClassForCell(PizzaInfoTableViewCell.self)
        bindPresenter()
        
       
      
    }
    //MARK: - Private Functions
    
    private func bindPresenter() {

        self.presenter.bannerImages
                .bind(to: self.rootView.bannerViewCollectionView.rx.items(AdvertisementBannerCollectionCell.self)) { _, image, cell in
                    
                    
                    cell.set(image: image ?? UIImage())
                    
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
                    
                    
                }.disposed(by: self.disposeBag)
        
        
        self.presenter.menuCategory
            .bind(to: self.rootView.menuCatergoryCollectionView.rx.items(MenuCatergoryCell.self)) { _, categoryMenu, cell in
                cell.set(category: categoryMenu)
            }.disposed(by: disposeBag)
        
        self.menuItemsData
            .bind(to: self.rootView.tableView.rx.items(PizzaInfoTableViewCell.self)) { _, model, cell in
                
              //  cell.configure(model: model)
                
                if let imageUrl = model.image {
                    self.presenter.loadBannerImage(with: imageUrl)
                    self.productImage
                        .subscribe(onNext: { image in
                            if let image = image {
                                cell.configure(model: model, image: image)
                            }

                        }).disposed(by: self.disposeBag)

                }

                
                
            }.disposed(by: disposeBag)
    }
    
}

extension PizzaListVC: PizzaListView {
    func getProductImage(_ image: UIImage) {
        productImage.accept(image)
      
    }
    
    func getMenuItems(_ menuItems: [MenuItem]) {
        print("1111-2", menuItems)
        menuItemsData.accept(menuItems)
    }
    
    
}
