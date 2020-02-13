//
//  HomeInteractor.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol?
    
    func fetchVehiclesList() {
        
        guard AppManager.shared.connectedToNetwork() else {
            if let vehicles = DataManager.shared.retrieveDataFromDisk() {
                self.presenter?.fetchUsingOfflineMode(vehicles: vehicles)
            }
            return
        }
        
        
        // internet failure...
        // handle api call and response
        APIClient.getLocations { result in
            switch result {
            case .success(let response):
                self.presenter?.fetchVehiclesListSuccess(vehicles: response.placemarks)
                DataManager.shared.saveDataToDisk(vehicles: response.placemarks)
            case .failure(let error):
                print(error)
                self.presenter?.fetchPicturesListFailed()
            }
        }
        
    }
    
    
}
