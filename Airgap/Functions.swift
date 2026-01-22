//
//  Functions.swift
//  Airgap
//
//  Created by Evan Plant on 22/01/2026.
//

import Foundation
import FoundationModels

// MARK: - Models availability stuffs
enum ModelsUnavailableReason {
    case deviceNotEligible
    case appleIntelligenceNotEnabled
    case modelNotReady
    case unknown(reason: SystemLanguageModel.Availability.UnavailableReason)
}
