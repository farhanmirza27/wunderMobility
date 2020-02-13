//
//  ApiCient.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//



import Alamofire
import RxSwift

class APIClient {
    
    static func fetchVehicles(route : APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Observable<Response> {
        return Observable<Response>.create { observer -> Disposable in
            let request = AF.request(route)
                .responseDecodable (decoder: decoder){ (response: AFDataResponse<Response>) in
                    switch response.result {
                    case .success(let response):
                        observer.onNext(response)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
}

