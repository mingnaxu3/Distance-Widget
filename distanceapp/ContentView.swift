//
//  ContentView.swift
//  distanceapp
//
//  Created by Ming Xu on 12/22/25.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = DistanceViewModel()
    @State private var navigateToLocationView = false
    
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                
                
                Text("Enable location to use the widget! ")
                
                Button("Allow Location Access") {
                    locationManager.requestPermission()
                    navigateToLocationView = true
                }
                
                EmptyView()
                
            }
            .navigationDestination(isPresented: $navigateToLocationView) {
                LocationView(locationManager: locationManager, viewModel: viewModel)
            }
                
                
            
          
            
            
            
        }
        .padding()
        .onChange(of: locationManager.currLocation) { guard let location = locationManager.currLocation else {return}
            
            FirebaseManager.shared.uploadLocation(pairCode: viewModel.pairCode, userId: viewModel.userId, location: location )
            
            FirebaseManager.shared.listenForOtherUser(pairCode: viewModel.pairCode, userId: viewModel.userId) {
                otherLocation in viewModel.calculateDistance(myLocation: location, otherLocation: otherLocation)
            }
            
            
        }
        
    }
    
}

// MARK: - LocationView
struct LocationView: View {
    @ObservedObject var locationManager: LocationManager
    @ObservedObject var viewModel: DistanceViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if let location = locationManager.currLocation {
                
                
                Text("Latitude: \( location.coordinate.latitude)")
                Text("Longitude: \( location.coordinate.longitude)")
            } else {
                Text("Waiting for location...")
            }
            if let distance = viewModel.distanceMiles {
                Text("Distance: \(distance)")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
