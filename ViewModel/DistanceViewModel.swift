//
//  DistanceViewModel.swift
//  distanceapp
//
//  Created by Ming Xu on 12/22/25.
//

import Foundation
import CoreLocation
import WidgetKit

final class DistanceViewModel: ObservableObject {

    // TODO: Published distance (Double?)
    @Published var distanceMiles: Double?
    

    // TODO:
    // pairCode (String)
    let pairCode = "TEST123"
    // userId (String)
    let userId = UUID().uuidString

    func calculateDistance(
        myLocation: CLLocation,
        otherLocation: CLLocation
    ) {
        // TODO:
        // Use CLLocation to calculate distance
        // Store result
        distanceMiles = myLocation.distance(from: otherLocation)
        distanceMiles = distanceMiles! / 1609
        saveDistanceForWidget(distanceMiles ?? 0)
        
        
    }
    
    //save the distance and communicate it to the widget
    private func saveDistanceForWidget(_ distance: Double) {
        let defaults = UserDefaults(suiteName: "group.com.mingna.distanceapp")
        defaults?.set(distance, forKey: "distanceMiles")
        WidgetCenter.shared.reloadAllTimelines()
        WidgetCenter.shared.reloadTimelines(ofKind: "distanceWidget")
    }
}
