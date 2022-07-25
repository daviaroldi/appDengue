//
//  AppTabView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                DengueMapView()
            }
            .tabItem {
                Label("Map", systemImage: "map.fill")
            }

            NavigationView {
                FocusRegistrationView()
            }
            .tabItem {
                Label("Register", systemImage: "ladybug.fill")
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
