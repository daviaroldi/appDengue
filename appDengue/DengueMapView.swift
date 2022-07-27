//
//  DengueMapView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import MapKit
import CoreLocation

//class Model: ObservableObject {
//    @Published var selection: Int? {
//        willSet {
//            if let nv = newValue {
//                selected = nv
//                willChangeSelection?(selected)
//            }
//        }
//    }
//    var selected: Int = 0
//    let willChangeSelection: ((Int) -> Void)?
//    init( onSelection: ((Int)->Void)? ) {
//        willChangeSelection = onSelection
//        selection = 1
//    }
//}

struct DengueMapView: View {
    @State var tracking : MapUserTrackingMode = .follow

    @State var manager = CLLocationManager()

    @StateObject var managerDelegate = locationDelegate()
    
    @Binding var focusPoints : [Pin]
    
//    @ObservedObject var model = Model { i in
//        if managerDelegate.location == nil {
//
//        }
//    }

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
                
//                NavigationLink(
//                    destination: FocusRegistrationView(focusPoints: self._focusPoints)
//                                    .environmentObject(managerDelegate),
//                    tag: 1,
//                    selection: $model.selection) {
//                    Text("Registrar Foco")
//                }
//                let _test = managerDelegate.location == nil
//                NavigationLink(
//                    destination: defineDestination(),
//                    isActive: ,
//                    label: {
//                        
//                    }
//                )

            }

        }.onAppear{
            manager.delegate = managerDelegate
        }
    }
    
    @ViewBuilder
    func defineDestination() -> some View {
        if managerDelegate.location == nil {
            EmptyView()
        } else {
            FocusRegistrationView(focusPoints: self._focusPoints)
                        .environmentObject(managerDelegate)
        }
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
