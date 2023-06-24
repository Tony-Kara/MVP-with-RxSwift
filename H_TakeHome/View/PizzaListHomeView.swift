//
//  PizzaListHomeView.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit
import SnapKit

final class PizzaListHomeView: UIView {
    
// MARK: - Private properties
    
    private lazy var backgroundView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        return view
    }()
 
    // MARK: - Public properties
    
    lazy var bannerViewCollectionView: UICollectionView = {
        let layout = AdvertisementBannerCollectionLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    lazy var menuCatergoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .automatic
        return tableView
        }()
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
