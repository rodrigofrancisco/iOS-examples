//
//  FormAnswerPage.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 02/03/25.
//

import SwiftUI

struct FormAnswerPage: View {
    private let numberOfQuestions: Int
    private let options: [String]
    @Binding private var userAnswers: [String?]
    private let correctAnwers: [String]?
    
    private let bounds: [GradingConfiguration.Bound]
    
    init(numberOfQuestions: Int, options: [String], userAnswers: Binding<[String?]>, correctAnswers: [String]? = nil, bounds: [GradingConfiguration.Bound]) {
        self.numberOfQuestions = numberOfQuestions
        self.options = options
        self._userAnswers = userAnswers
        self.correctAnwers = correctAnswers
        self.bounds = bounds
    }
    
    var body: some View {
        if numberOfQuestions > 0 {
            ForEach((1...numberOfQuestions), id: \.self) { questionNumber in
                VStack {
                    if let bound = getBound(for: questionNumber) {
                        Text(bound.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                    }
                    radioOptions(for: questionNumber)
                }
            }
        } else {
            ProgressView()
        }
    }
    
    private func radioOptions(for questionNumber: Int) ->  some View {
        HStack {
            HorizontalRadioGroupLayout(
                labelNumber: questionNumber,
                options: options,
                selected: $userAnswers[questionNumber - 1]
            )
            if let correctAnwers = correctAnwers {
                if correctAnwers[questionNumber - 1] == userAnswers[questionNumber - 1] {
                    Image(systemName: "checkmark")
                } else {
                    Image(systemName: "xmark")
                }
            }
        }
    }
    
    private func getBound(for number: Int) -> GradingConfiguration.Bound? {
        bounds.first(where: { number >= $0.lowerBound && number < $0.upperBound })
    }
}

#Preview {
    FormAnswerPage(
        numberOfQuestions: 10,
        options: ["A", "B", "C", "D"],
        userAnswers: .constant(Array(repeating: nil, count: 10)),
        correctAnswers: nil, bounds: [
            .init(name: "Español", lowerBound: 1, upperBound: 3),
            .init(name: "Matemáticas", lowerBound: 4, upperBound: 5),
            .init(name: "Historia", lowerBound: 4, upperBound: 5),
        ]
    )
}
