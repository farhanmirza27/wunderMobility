//
//  HomeInteractor.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol?
   
    private var disposeBag = DisposeBag()
    
    func fetchVehiclesList() {
        
        // internet failure...
        guard AppManager.shared.connectedToNetwork() else {
            if let vehicles = DataManager.shared.retrieveDataFromDisk() {
                self.presenter?.fetchUsingOfflineMode(vehicles: vehicles)
            }
            return
        }
        
        // handle api call and response
            APIClient
                .fetchVehicles(route: APIRouter.locations)
                .subscribe(
                    onNext: { vehicles in
                        self.presenter?.fetchVehiclesListSuccess(vehicles: vehicles.placemarks)
                },
                    onError: { error in
                        self.presenter?.fetchPicturesListFailed()
                }
            )
                .disposed(by: disposeBag)
        
    }
    
    
}
