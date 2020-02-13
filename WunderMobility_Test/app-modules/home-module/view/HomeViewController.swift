//
//  ViewController.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private let reuseIdentifier = "ListCellId"

class HomeViewController: UITableViewController {
    
    var presenter : ViewToPresenterHomeProtocol?
    
    var vehicles = BehaviorRelay(value: [Vehicle]())
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        bindTableViewData()
        bindTableViewSelected()
        presenter?.fetchVehiclesList()
    }
    
    func setupViews() {
        navigationItem.title = "Vehicles List"
        tableView.dataSource = nil
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named : "location"), style: .plain, target: self, action: #selector(navigateToMapView))
        
    }
    
    @objc func navigateToMapView() {
        presenter?.showMapView(vehicles: self.vehicles.value, navigationController: navigationController!)
    }
    
    
    private func bindTableViewData() {
        self.vehicles.bind(to: self.tableView.rx.items(cellIdentifier: reuseIdentifier, cellType: ListTableViewCell.self)) { index, model, cell in
            cell.bindData(data: model)
        }.disposed(by: self.disposeBag)
    }
    
    private func bindTableViewSelected() {
        tableView
            .rx
            .modelSelected(Vehicle.self)
            .subscribe(onNext :{ [weak self] model in
                guard let strongSelf = self else { return }
                self!.presenter?.showMapView(vehicles: [model], navigationController: strongSelf.navigationController!)
                
            }).disposed(by: disposeBag)
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
    func displayVehicalsList(vehicles: [Vehicle]) {
        self.vehicles.accept(vehicles)
    }
    
    func showError() {
        self.alert(message: "No Internet")
    }
}
