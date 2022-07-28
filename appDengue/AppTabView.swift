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
        Pin(location: CLLocation(latitude: -22.713531, longitude: -43.209587), severity: Severity.suspect),
        Pin(location: CLLocation(latitude: -22.804531, longitude: -43.209587), severity: Severity.focus),
        Pin(location: CLLocation(latitude: -22.603531, longitude: -43.209587), severity: Severity.focus)
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                DengueMapView(focusPoints: $focusPoints)
            }
            .tabItem {
                Label("Mapa", systemImage: "map.fill")
            }
            
            NavigationView {
                OversightGuideView()
            }
            .tabItem {
                Label("Guide", systemImage: "newspaper.fill")
            }
        }
        .accentColor(.orange)
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
            .preferredColorScheme(.dark)
    }
}
