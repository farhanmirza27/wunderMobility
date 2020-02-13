//
//  MapRouter.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


class MapRouter : PresenterToRouterMapProtocol {
    
    static func createModule(vehicle : Vehicle) -> MapViewController {
        let view =  MapViewController()
        let presenter: ViewToPresenterMapProtocol & InteractorToPresenterMapProtocol = MapPresenter()
        let interactor: PresenterToInteractorMapProtocol = MapInteractor()
        let router:PresenterToRouterMapProtocol = MapRouter()
        
        view.presenter = presenter
        view.vehicle = vehicle
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    
}
