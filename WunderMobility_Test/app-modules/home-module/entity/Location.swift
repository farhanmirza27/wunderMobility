//
//  Locations.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


struct Vehicle : Codable {
    var address : String
    var coordinates : [Double]
    var engineType : String
    var exterior : String
    var fuel : Double
    var interior : String
    var name : String
    var vin : String
}



