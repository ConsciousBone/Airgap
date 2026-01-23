//
//  Functions.swift
//  Airgap
//
//  Created by Evan Plant on 22/01/2026.
//

import Foundation
import FoundationModels

// MARK: - Foundation models stuffs
enum ModelsUnavailableReason {
    case deviceNotEligible
    case appleIntelligenceNotEnabled
    case modelNotReady
    case unknown(reason: SystemLanguageModel.Availability.UnavailableReason)
}

@MainActor
func sendModelsPrompt(prompt: String) async -> String {
    let instructions = Instructions { """
        You are a friendly AI assistant.
        """
    }
    let session = LanguageModelSession(instructions: instructions)
    
    do {
        let response = try await session.respond(to: prompt)
        print("model response: \(response.content)")
        return "\(response.content)"
    } catch {
        print("failed to get response: \(error.localizedDescription)")
        return "An error occured. (\(error.localizedDescription))"
    }
    
}
