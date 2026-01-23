//
//  HomeView.swift
//  Airgap
//
//  Created by Evan Plant on 22/01/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var userInput = ""
    @State private var modelResponse = "no response yet"
    
    var body: some View {
        Form {
            Section("input") {
                TextField("test", text: $userInput)
                Button {
                    Task {
                        let response = await sendModelsPrompt(prompt: userInput)
                        await MainActor.run { modelResponse = response }
                    }
                } label: {
                    Label("send prompt", systemImage: "paperplane")
                }
            }
            
            Section("output") {
                Text(modelResponse)
            }
        }
    }
}

#Preview {
    HomeView()
}
