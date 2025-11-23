//
//  ShowResultsPage.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 02/03/25.
//

import SwiftUI

struct ShowResultsPage: View {
    private let numberOfQuestions: Int
    private let options: [String]
    private let correctAnswers: [String]
    private let bounds: [GradingConfiguration.Bound]
    
    private let title: String
    private let studentName: String
    @Binding private var userAnswers: [String?]
    
    private let totalCorrectUserAnswers: Int
    
    @Environment(\.dismiss) private var dismiss
    
    private let onDismissed: () -> Void
    
    init(title: String, studentName: String, numberOfQuestions: Int,
         options: [String],
         userAnswers: Binding<[String?]>,
         correctAnswers: [String], bounds: [GradingConfiguration.Bound],
         onDismissed: @escaping () -> Void
    ) {
        self.numberOfQuestions = numberOfQuestions
        self.options = options
        self._userAnswers = userAnswers
        self.correctAnswers = correctAnswers
        self.bounds = bounds
        
        self.title = title
        self.studentName = studentName
        
        self.onDismissed = onDismissed
        
        self.totalCorrectUserAnswers = Grader(correctAnswers: correctAnswers)
            .grade(userAnswers: userAnswers.wrappedValue.compactMap { $0 })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HStack {
                        Text(studentName)
                        Spacer()
                        Text("Total: \(totalCorrectUserAnswers)/\(numberOfQuestions)")
                    }
                    .font(.headline)
                    gradingDetails
                    FormAnswerPage(
                        numberOfQuestions: numberOfQuestions,
                        options: options,
                        userAnswers: $userAnswers,
                        correctAnswers: correctAnswers,
                        bounds: bounds
                    )
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(title)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Finalizar") {
                        onDismissed()
                        dismiss()
                    }
                }
                
            }
        }
    }
    
    private var gradingDetails: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("**Español:** 10/12")
            Text("**Matemáticas:** 10/12")
            Text("**Historia:** 10/12")
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ShowResultsPage(
        title: "Examen Bachillerato UNAM 2021",
        studentName: "Rodrigo Francisco",
        numberOfQuestions: 120,
        options: ["A", "B", "C", "D"],
        userAnswers: .constant(Array(repeating: "A", count: 120)),
        correctAnswers: Array(repeating: "A", count: 120),
        bounds: [], onDismissed: {}
    )
}
