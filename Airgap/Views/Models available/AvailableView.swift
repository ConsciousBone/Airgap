//
//  AvailableView.swift
//  Airgap
//
//  Created by Evan Plant on 22/01/2026.
//

import SwiftUI

struct AvailableView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
        }
    }
}

#Preview {
    AvailableView()
}
