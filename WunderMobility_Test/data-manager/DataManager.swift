//
//  DataManager.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 13/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Disk

class DataManager {
  static let shared = DataManager()
    
    func saveDataToDisk(vehicles : [Vehicle]) {
        do {
            try Disk.save(vehicles, to: .documents, as: "vehicles.json")
        } catch {
            // ...
        }
    }
    
    
    func retrieveDataFromDisk() -> [Vehicle]? {
      let vehicles = try? Disk.retrieve("vehicles.json", from: .documents, as: [Vehicle].self)
      return vehicles
    }
}

