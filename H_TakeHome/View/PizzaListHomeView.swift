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
        view.backgroundColor = .white
        return view
    }()
 
    // MARK: - Public properties
    
    lazy var bannerViewCollectionView: UICollectionView = {
        let layout = BannerCellFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        collectionView.showsHorizontalScrollIndicator = false
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
        setupInitialLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions

    func setupInitialLayout() {
        addSubview(backgroundView)
        [bannerViewCollectionView, menuCatergoryCollectionView].forEach { backgroundView.addSubview($0) }

        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
        }

        bannerViewCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(112)
            make.width.equalTo(300)
        }

        menuCatergoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannerViewCollectionView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(12)
            
        }
    }

}

