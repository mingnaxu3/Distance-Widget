//
//  FirebaseManager.swift
//  distanceapp
//
//  Created by Ming Xu on 12/22/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import CoreLocation

final class FirebaseManager {

    static let shared = FirebaseManager()

    // TODO: Firestore reference
    
    private let db = Firestore.firestore()

    private init() {}

    func uploadLocation(
        pairCode: String,
        userId: String,
        location: CLLocation
    ) {
        // TODO:
        // Convert CLLocation into a Firestore-friendly dictionary
        let data: [String: Any] = [
            "latitude": location.coordinate.latitude,
            "longitude": location.coordinate.longitude,
            "updatedAt": Date()
        ]
        // Upload to Firestore
        db.collection("pairs")
            .document(pairCode)
            .collection("users")
            .document(userId)
            .setData(data)
    }

    func listenForOtherUser(
        pairCode: String,
        userId: String,
        completion: @escaping (CLLocation) -> Void
    ) {
        // TODO:
        // Listen for changes in Firestore
        db.collection("pairs")
            .document(pairCode)
            .collection("users")
            .addSnapshotListener { snapshot, _ in
                guard let docs = snapshot?.documents else {return}
                
                for doc in docs where doc.documentID != userId {
                    let lat = doc["latitude"] as? Double ?? 0
                    let lng = doc["longitude"] as? Double ?? 0
                    completion(CLLocation(latitude:lat, longitude: lng))
                }
                
            }
        
    }
}
