
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import Foundation

protocol ProfileInfoViewPresenter: AnyObject {
    init(view: ProfileInfoView)
}

class ProfileInfoPresenter: ProfileInfoViewPresenter {
    private weak var view: ProfileInfoView?
    
    required init(view: ProfileInfoView) {
        self.view = view
    }
    
    
}
