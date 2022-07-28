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
    var severity : Severity
    
    func getSeverityColor() -> Color {
        switch self.severity {
        case Severity.focus:
            return Color.red
        case Severity.suspect:
            return Color.yellow
        default:
            return Color.red
        }
    }
}

enum Severity {
    case focus
    case suspect
    
    func getName() -> String {
        switch self {
        case Severity.focus:
            return "Com Foco"
        case Severity.suspect:
            return "Com Suspeita"
        default:
            return "Com Foco"
        }
    }
    
    static func getSeverityByIndex(index: Int) -> Severity {
        switch index {
        case 0:
            return Severity.focus
        case 1:
            return Severity.suspect
        default:
            return Severity.focus
        }
    }
    
    static func getArraySeverityNames() -> [String] {
        return [Severity.focus.getName(), Severity.suspect.getName()]
    }
}
