//
//  HomeView.swift
//  Airgap
//
//  Created by Evan Plant on 22/01/2026.
//

import SwiftUI
import FoundationModels

struct HomeView: View {
    @State private var userInput = ""
    @State private var modelResponse = "no response yet"
    
    var body: some View {
        Form {
            Section("input") {
                TextField("test", text: $userInput)
                Button {
                    Task {
                        let instructions = Instructions{"""
                            You are a helpful, friendly AI assistant.
                            """}
                        let session = LanguageModelSession(instructions: instructions)

                        modelResponse = ""

                        do {
                            let stream = session.streamResponse(to: userInput)
                            for try await partial in stream {
                                modelResponse = partial.content
                            }
                        } catch {
                            modelResponse = "an error occured: (\(error.localizedDescription))"
                        }
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
