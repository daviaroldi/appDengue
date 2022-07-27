//
//  DengueMapView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct DengueMapView: View {
    @State var tracking : MapUserTrackingMode = .follow

    @State var manager = CLLocationManager()

    @StateObject var managerDelegate = locationDelegate()
    
    @State var isRegistrationViewActive: Bool = false
    
    @Binding var focusPoints : [Pin]

    var body: some View {
        VStack{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Map(coordinateRegion: $managerDelegate.region, interactionModes: .all, showsUserLocation: true, annotationItems: focusPoints) { focusPoint in
                    MapAnnotation(coordinate: focusPoint.location.coordinate) {
                        Circle()
                            .stroke(Color.red, lineWidth: 1)
                            .background(Color.red.opacity(0.5))
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    }

                }.edgesIgnoringSafeArea(.all)
                
                NavigationLink(
                    destination: FocusRegistrationView(focusPoints: self._focusPoints, isViewActive: $isRegistrationViewActive)
                        .environmentObject(managerDelegate),
                    isActive: $isRegistrationViewActive,
                    label: {
                        Text("Registrar Foco")
                    })

            }

        }.onAppear{
            manager.delegate = managerDelegate
        }
//        .navigationBarItems(trailing: Button {
//            self.isRegistrationViewActive.toggle()
//        } label: {
//            Text("Registrar Foco")
//        })
    }
}

//struct DengueMapView_Previews: PreviewProvider {
//    static var focusPoints : [Pin] = [
//        Pin(location: CLLocation(latitude: -21.903531, longitude: -43.209587)),
//        Pin(location: CLLocation(latitude: -21.903521, longitude: -43.209587))
//    ]
//    static var previews: some View {
//        DengueMapView(focusPoints: .constant(focusPoints))
//    }
//}
