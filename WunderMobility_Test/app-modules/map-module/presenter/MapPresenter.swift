//
//  MapPresenter.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


import UIKit

// handle functions by View
class  MapPresenter  : ViewToPresenterMapProtocol {
    var view: PresenterToViewMapProtocol?
    
    var interactor: PresenterToInteractorMapProtocol?
    
    var router: PresenterToRouterMapProtocol?
    
}

// handle functions by Interactor
extension MapPresenter : InteractorToPresenterMapProtocol {
 
}
