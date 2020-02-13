//
//  HomeProtocols.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import UIKit

// List of protocols for home app module

protocol ViewToPresenterHomeProtocol: class{
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func fetchVehiclesList()
    func showMapView(vehicles : [Vehicle], navigationController : UINavigationController)
    
}

protocol PresenterToViewHomeProtocol: class {
    func displayVehicalsList(vehicles : [Vehicle])
    func showError()
}

protocol PresenterToRouterHomeProtocol: class {
    static func createModule()-> HomeViewController
    func showMapView(vehicle : Vehicle, navigationController : UINavigationController)
}

protocol PresenterToInteractorHomeProtocol: class {
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    func fetchVehiclesList()
}

protocol InteractorToPresenterHomeProtocol: class {
    func fetchVehiclesListSuccess(vehicles : [Vehicle])
    func fetchPicturesListFailed()
    func fetchUsingOfflineMode(vehicles : [Vehicle])
}

