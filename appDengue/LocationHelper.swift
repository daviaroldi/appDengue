//
//  LocationHelper.swift
//  appDengue
//
//  Created by aluno13 on 27/07/22.
//

import Foundation
import CoreLocation

class LocationHelper {
    //private let address = "1 Infinite Loop, Cupertino, CA 95014"
    static func ConvertAddressToLocation(targetAddress: String, completion: @escaping (CLLocation) -> ()) {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(targetAddress) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let foundLocation = placemarks.first?.location
                //return location
            else {
                // handle no location found
                return
            }
            
            completion(foundLocation)
            //print(foundLocation)
            // Use your location
            //location = foundLocation
        }
        
        //return location
    }
}

