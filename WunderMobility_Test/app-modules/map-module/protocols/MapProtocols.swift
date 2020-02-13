//
//  MapProtocols.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// List of protocols for home app module

protocol ViewToPresenterMapProtocol: class{
    var view: PresenterToViewMapProtocol? {get set}
    var interactor: PresenterToInteractorMapProtocol? {get set}
    var router: PresenterToRouterMapProtocol? {get set}
    //
}

protocol PresenterToViewMapProtocol: class {
    //
}

protocol PresenterToRouterMapProtocol: class {
    static func createModule(vehicle : Vehicle)-> MapViewController
}

protocol PresenterToInteractorMapProtocol: class {
    var presenter:InteractorToPresenterMapProtocol? {get set}
    //
}

protocol InteractorToPresenterMapProtocol: class {
    //
}

