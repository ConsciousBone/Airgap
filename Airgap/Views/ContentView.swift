//
//  ContentView.swift
//  Airgap
//
//  Created by Evan Plant on 17/01/2026.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    private var model = SystemLanguageModel.default
    
    var body: some View {
        switch model.availability {
        case .available:
            AvailableView()
        case .unavailable(.deviceNotEligible):
            ModelsUnavailableView(reason: .deviceNotEligible)
        case .unavailable(.appleIntelligenceNotEnabled):
            ModelsUnavailableView(reason: .appleIntelligenceNotEnabled)
        case .unavailable(.modelNotReady):
            ModelsUnavailableView(reason: .modelNotReady)
        case .unavailable(let other):
            ModelsUnavailableView(reason: .unknown(reason: other))
        }
    }
}

#Preview {
    ContentView()
}
