//
//  CustomLocationManager.swift
//  appDengue
//
//  Created by aluno12 on 26/07/22.
//

import SwiftUI
import MapKit
import CoreLocation

class locationDelegate: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var location: CLLocation?

    @State var hasSetRegion = false

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        if manager.authorizationStatus == .authorizedWhenInUse{
            print("Authorized")
            manager.startUpdatingLocation()
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {

            self.location = location

            if hasSetRegion == false{
                region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                hasSetRegion = true
            }
        }
    }
}

// Map pins for update
struct Pin : Identifiable {
    var id = UUID().uuidString
    var location : CLLocation
}

