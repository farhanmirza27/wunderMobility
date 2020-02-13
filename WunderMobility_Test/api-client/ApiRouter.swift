//
//  ApiRouter.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case locations
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .locations:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        case .locations:
            return "/locations.json"
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .locations:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let base = URL(string: WunderApp.TestServer.baseURL)!
        let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
        let url = URL(string: baseAppend!)
        
        var urlRequest =  URLRequest(url: url!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

