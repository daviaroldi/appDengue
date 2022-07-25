//
//  FocusRegistrationView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct FocusRegistrationView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var focusPointAddress: String = "teste"
    @State private var isAddressFocused: Bool = false
    
    var body: some View {
        VStack() {
            Text("Passo 1: Endereço")
            
            TextField("Passo 1: Endereço", text: $focusPointAddress)
            
            TextField("Data De Registro", text: $focusPointAddress)
                .disabled(true)
                .disableAutocorrection(true)
        }
        .navigationTitle("Registrar foco")
//        VStack {
//            Map(coordinateRegion: $mapRegion)
//        }
    }
}

struct FocusRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FocusRegistrationView()
    }
}
