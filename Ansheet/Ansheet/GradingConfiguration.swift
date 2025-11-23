//
//  GradingConfiguration.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 03/03/25.
//

struct GradingConfiguration {
    struct Bound {
        let name: String
        let lowerBound: Int
        let upperBound: Int
    }
    
    let examTitle: String
    let numberOfQuestions: Int
    let numberOfOptions: Int
    let correctAnswers: [String]
    
    let bounds: [Bound]
    
    var options: [String] {
        let generatedOptions = ["A", "B", "C", "D", "E"]
        return Array(generatedOptions[0...numberOfOptions])
    }
}

struct GradingSystemConfigurationService {
    func getConfig() async throws -> GradingConfiguration {
        return try await withCheckedThrowingContinuation { continuation in
            let numberOfQuestions = 10
            let data = GradingConfiguration(
                examTitle: "Examen Bachillerato UNAM 2021",
                numberOfQuestions: numberOfQuestions,
                numberOfOptions: 4,
                correctAnswers: Array(repeating: ["A", "B", "C", "D"].randomElement() ?? "A", count: numberOfQuestions),
                bounds: [
                    GradingConfiguration.Bound(name: "Español", lowerBound: 1, upperBound: 2),
                    GradingConfiguration.Bound(name: "Matemáticas", lowerBound: 3, upperBound: 4),
                ]
            )
            continuation.resume(with: .success(data))
        }
    }
}
