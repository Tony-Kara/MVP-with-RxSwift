//
//  BannerCellFlowLayout.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit

final class BannerCellFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        scrollDirection = .vertical
        collectionView.showsVerticalScrollIndicator = false
        minimumInteritemSpacing = 0
        minimumLineSpacing = 16
        
        
        
    }
    
    
    
}
