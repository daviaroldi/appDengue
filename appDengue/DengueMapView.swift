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
    
    @State var isLocationDisable: Bool = false

    var body: some View {
        VStack{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Map(coordinateRegion: $managerDelegate.region, interactionModes: .all, showsUserLocation: true, annotationItems: focusPoints) { focusPoint in
                    MapAnnotation(coordinate: focusPoint.location.coordinate) {
                        Circle()
                            .stroke(focusPoint.getSeverityColor(), lineWidth: 1)
                            .background(focusPoint.getSeverityColor().opacity(focusPoint.severity == .focus ? 0.7 : 0.3))
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    }
                    

                }.edgesIgnoringSafeArea(.all)

                Button(action: {
                    isLocationDisable = managerDelegate.location == nil
                    isRegistrationViewActive = !isLocationDisable
                }, label: {
                    Text("Registrar Foco")
                        .font(.system(size:16))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.orange)
                            .clipShape(Capsule())
                })
                .padding()
                .alert(isPresented: $isLocationDisable, content: {
                    Alert(title: Text("Coordenadas geaograficas não disponvíveis\nPor favor tente reposicionar a localização"))
                })

                NavigationLink("", destination: FocusRegistrationView(focusPoints: self._focusPoints, isViewActive: $isRegistrationViewActive)
                                .environmentObject(managerDelegate), isActive: $isRegistrationViewActive)
            }

        }.onAppear{
            manager.delegate = managerDelegate
        }
    }
}

struct DengueMapView_Previews: PreviewProvider {
    static var focusPoints : [Pin] = [
        Pin(location: CLLocation(latitude: -21.903531, longitude: -43.209587), severity: Severity.focus),
        Pin(location: CLLocation(latitude: -21.903521, longitude: -43.209587), severity: Severity.suspect)
    ]
    static var previews: some View {
        DengueMapView(focusPoints: .constant(focusPoints))
    }
}
