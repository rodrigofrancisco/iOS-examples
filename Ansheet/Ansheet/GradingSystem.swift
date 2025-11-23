//
//  ContentView.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 02/03/25.
//

import SwiftUI

struct GradingSystem: View {
    private let service: GradingSystemConfigurationService
    
    @State private var config: GradingConfiguration?
    @State private var userAnswers: [String?] = []
    @State private var name: String = ""
    @State private var didTappedGrade: Bool = false
    
    @State private var serviceFailed: Bool = false
    
    init(service: GradingSystemConfigurationService = GradingSystemConfigurationService()) {
        self.service = service
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !serviceFailed {
                    form
                } else {
                    retryView
                }
                bottomStickedView
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $didTappedGrade, destination: showResultDestination)
        }
        .task {
            await getConfig()
        }
    }
    
    private var retryView: some View {
        ScrollView {
            Button("Retry") {
                self.serviceFailed = false
                Task { await getConfig() }
            }
        }
    }
    
    private var form: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                TextField("Nombre completo", text: $name)
                FormAnswerPage(
                    numberOfQuestions: config?.numberOfQuestions ?? 0,
                    options: config?.options ?? [],
                    userAnswers: $userAnswers,
                    bounds: config?.bounds ?? []
                )
            }
        }
    }
    
    private var bottomStickedView: some View {
        HStack {
            Text("\(numberOfAnsweredQuestions)/\(config?.numberOfQuestions ?? 0)")
            Spacer()
            Button { didTappedSubmit() } label: {
                Text("Calificar")
            }
            .buttonStyle(.borderedProminent)
            .disabled(buttonShouldBeDisabled)
        }
    }
    
    private func getConfig() async {
        do {
            config = try await service.getConfig()
            userAnswers = Array(repeating: nil, count: config?.numberOfQuestions ?? 0)
            name = ""
        } catch {
            self.serviceFailed = true
        }
    }
    
    private var title: String {
        if !serviceFailed {
            return config?.examTitle ?? "Loading"
        } else {
            return "Failed"
        }
    }
    
    private var buttonShouldBeDisabled: Bool {
        return !allQuestionsAnswered || name.isEmpty
    }
    
    private var allQuestionsAnswered: Bool {
        return numberOfAnsweredQuestions == config?.numberOfQuestions
    }
    
    private var numberOfAnsweredQuestions: Int {
        userAnswers.compactMap { $0 }.count
    }
    
    private func didTappedSubmit() {
        didTappedGrade = true
    }
    
    private func showResultDestination() -> some View {
        ShowResultsPage(
            title: config?.examTitle ?? "",
            studentName: name,
            numberOfQuestions: config?.numberOfQuestions ?? 0,
            options: config?.options ?? [],
            userAnswers: .constant($userAnswers.wrappedValue),
            correctAnswers: config?.correctAnswers ?? [],
            bounds: [], onDismissed: {
                Task {
                    await getConfig()
                }
            }
        )
    }
}

#Preview {
    GradingSystem()
}
