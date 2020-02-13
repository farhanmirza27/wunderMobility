//
//  HomePresenter.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import UIKit

// handle functions by View
class  HomePresenter  : ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol?
    
    var interactor: PresenterToInteractorHomeProtocol?
    
    var router: PresenterToRouterHomeProtocol?
    
    
    func fetchVehiclesList() {
        interactor?.fetchVehiclesList()
    }
    
    func showMapView(vehicle: Vehicle, navigationController: UINavigationController) {
        let mapModule = MapRouter.createModule(vehicle: vehicle)
        navigationController.pushViewController(mapModule, animated: true)
    }
    
    
}

// handle functions by Interactor
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
    func fetchUsingOfflineMode(vehicles: [Vehicle]) {
        view?.displayVehicalsList(vehicles: vehicles)
        view?.showError()
    }
    
    func fetchVehiclesListSuccess(vehicles: [Vehicle]) {
        view?.displayVehicalsList(vehicles: vehicles)
    }
    
    func fetchPicturesListFailed() {
        view?.showError()
    }
    
    
    
    
    
}
