//
//  HomeRouter.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit


class HomeRouter : PresenterToRouterHomeProtocol {

    static func createModule() -> HomeViewController {
        let view =  HomeViewController()
               let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
               let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
               let router:PresenterToRouterHomeProtocol = HomeRouter()
               
               view.presenter = presenter
               presenter.view = view
               presenter.router = router
               presenter.interactor = interactor
               interactor.presenter = presenter
               return view
    }
    
    func showMapView(vehicle : Vehicle, navigationController: UINavigationController) {
        //
    }
    
    
}
