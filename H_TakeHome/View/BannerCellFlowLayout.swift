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
        scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        minimumInteritemSpacing = 16
        minimumLineSpacing = 0
        
        sectionInset = .init(top: 0,
                             left: 0,
                             bottom: 0,
                             right: 0)
        
        let screenSize = UIScreen.main.bounds.width
        let widthSize = screenSize / 1.3
        
        let screenWidth = UIScreen.main.bounds.width
        
        if screenWidth <= 321 {
          itemSize = .init(width: widthSize, height: 96)
        } else {
          itemSize = .init(width: widthSize, height: 112)
        }
        
    }
}
