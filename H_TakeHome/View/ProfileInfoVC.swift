//
//  ProfileInfoVC.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation
import UIKit


protocol ProfileInfoView: AnyObject {
    
}

class ProfileInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var presenter: ProfileInfoViewPresenter!
}

extension ProfileInfoVC: ProfileInfoView{
    
}
