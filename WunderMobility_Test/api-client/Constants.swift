//
//  Constants.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


struct WunderApp {
    struct TestServer {
        static let baseURL = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios"
    }
    
    struct APIParameterKey {
        // if required any
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}



