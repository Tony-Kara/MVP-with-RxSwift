//
//  AdvertisementBannerCollectionCell.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit

final class AdvertisementBannerCollectionCell: UICollectionViewCell {
    
  //MARK: - Private Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
   //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpInitialLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setUpInitialLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview()}
    }
    
    private func configureView() {
        contentView.layer.cornerRadius = 16
        imageView.layer.cornerRadius = 16
        contentView.backgroundColor = .clear
    }
    
    
}
