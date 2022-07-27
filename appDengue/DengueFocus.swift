//
//  DengueFocus.swift
//  appDengue
//
//  Created by aluno13 on 26/07/22.
//

import Foundation
import CoreLocation

struct DengueFocus {
    let id: Int
    let address: String
    let registrationDate: Date
    let description: String
    let pointLocation: CLLocation
    
    init(_ id: Int = 0, _ address: String = "", _ registrationDate: Date = Date(), _ description: String = "", _ pointLocation: CLLocation = CLLocation()) {
        self.id = id
        self.address = address
        self.registrationDate = registrationDate
        self.description = description
        self.pointLocation = pointLocation
    }
}
