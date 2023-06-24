//
//  MenuCatergoryCell.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit

final class MenuCatergoryCell: UICollectionViewCell {
    
    //MARK: - Private Properties
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpInitialLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        if #available(iOS 13.0, *) {
            contentView.layer.cornerCurve = .continuous
        }
    }
    
    //MARK: - Private function
    
    func setUpInitialLayout() {
        contentView.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
