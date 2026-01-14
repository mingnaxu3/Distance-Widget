//
//  LocationManager.swift
//  distanceapp
//
//  Created by Ming Xu on 12/22/25.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    
    @Published var currLocation: CLLocation?
    
    override init() {
        super.init()
        
        //todo: set delegate
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        currLocation = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error in fetching location")
    }
}

