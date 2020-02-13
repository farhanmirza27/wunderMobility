//
//  ViewController.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ListCellId"

class HomeViewController: UITableViewController {

    var vehicles = [Vehicle]()
    
    var presenter : ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        navigationItem.title = "Vehicles"
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        presenter?.fetchVehiclesList()
    
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ListTableViewCell
        cell.bindData(data: vehicles[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMapView(vehicle: vehicles[indexPath.row], navigationController: self.navigationController!)
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
    func displayVehicalsList(vehicles: [Vehicle]) {
        self.vehicles = vehicles
        tableView.reloadData()
    }

    func showError() {
        self.alert(message: "No Internet")
    }
    
    
}
