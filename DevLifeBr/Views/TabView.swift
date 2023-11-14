//
//  TabView.swift
//  DevLifeBr
//
//  Created by Horacio Mota on 14/11/23.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            PaginaPrincipalView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Habilidades()
                .tabItem {
                    Label("Skills", systemImage: "brain.head.profile")
                }

            Empregos()
                .tabItem {
                    Label("Job", systemImage: "briefcase")
                }
        }
    }
}

