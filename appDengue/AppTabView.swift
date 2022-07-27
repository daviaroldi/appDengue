//
//  AppTabView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import CoreLocation

struct AppTabView: View {
    @State var focusPoints: [Pin] = [
        Pin(location: CLLocation(latitude: -21.903531, longitude: -43.209587)),
        Pin(location: CLLocation(latitude: -21.903521, longitude: -43.209587))
    ]
    var body: some View {
        TabView {
            NavigationView {
                DengueMapView(focusPoints: $focusPoints)
            }
            .tabItem {
                Label("Map", systemImage: "map.fill")
            }

            NavigationView {
                FocusRegistrationView()
            }
            .tabItem {
                Label("Register", systemImage: "pencil.circle.fill")
            }
            
            NavigationView {
                OversightGuideView()
            }
            .tabItem {
                Label("Guide", systemImage: "newspaper.fill")
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
