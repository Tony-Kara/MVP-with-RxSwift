//
//  PizzaInfoTableViewCell.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit
import RxSwift

final class PizzaInfoTableViewCell: UITableViewCell {
    
    private lazy var containerView = UIView()
    
    private lazy var pizzaPriceView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.hammer_TextColor_pizzaPrice.cgColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .hammer_TextColor_pizzaName
        return label
    }()
    
    private lazy var pizzaPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .hammer_TextColor_pizzaPrice
        return label
    }()
    
    private lazy var pizzaDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .hammer_TextColor_pizzaDescription
        return label
    }()
    
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Function
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
    private func configureView() {
        
        selectionStyle = .none
           backgroundColor = .clear
           contentView.backgroundColor = .clear
        
        containerView.layer.cornerRadius = 16
        if #available(iOS 13.0, *) {
            containerView.layer.cornerCurve = .continuous
        }
        // containerView.layer.addDropRoundedShadow(0.1)
    }
    
    private func setUpSubviews() {
        contentView.addSubview(containerView)
        [pizzaNameLabel, pizzaImageView, pizzaNameLabel, pizzaDescriptionLabel, pizzaPriceView].forEach {containerView.addSubview($0)}
        
        setupInitialLayout()
    }
    
    private func setupInitialLayout() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        pizzaImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(24)
            make.size.equalTo(132)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        pizzaNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalTo(pizzaImageView.snp.trailing).offset(32)
            
            
        }
        
        pizzaDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(pizzaNameLabel.snp.leading)
            make.top.equalTo(pizzaNameLabel.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        pizzaPriceView.snp.makeConstraints { make in
            make.top.equalTo(pizzaDescriptionLabel.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(32)
            make.width.equalTo(87)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        pizzaPriceView.addSubview(pizzaPriceLabel)
        
        pizzaPriceLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Public Function
    
    func configure(model: MenuItem, image: UIImage){
        DispatchQueue.main.async { [self] in
            pizzaImageView.image = image
            pizzaNameLabel.text = model.name
            pizzaDescriptionLabel.text = model.description
            pizzaPriceLabel.text = model.price
        }
        
    }
    
    func configure(model: MenuItem) {
        DispatchQueue.main.async { [self] in
            pizzaNameLabel.text = model.name
        }
    }
    
    
}
