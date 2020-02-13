//
//  MapViewController.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var vehicles = [Vehicle]()
    
    var mapView : GMSMapView!
    
    var presenter : ViewToPresenterMapProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        // Do any additional setup after loading the view.
    }
    
    
    func setupMapView() {
        if let coordinates = vehicles.first?.coordinates {
            
            let camera = GMSCameraPosition.camera(withLatitude: coordinates[1], longitude: coordinates[0], zoom: 15.0)
            mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            
            // Add Markers
            for item in vehicles {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(item.coordinates[1], item.coordinates[0])
                marker.title = item.name
                marker.map = mapView
            }
            
        }
        
        view = mapView
        mapView.delegate = self
    }
    
    
}

extension MapViewController : PresenterToViewMapProtocol {
    
}
