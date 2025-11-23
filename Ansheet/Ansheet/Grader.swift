//
//  Grader.swift
//  Ansheet
//
//  Created by RODRIGO FRANCISCO PABLO on 02/03/25.
//

struct Grader {
    let correctAnswers: [String]

    init(correctAnswers: [String]) {
        self.correctAnswers = correctAnswers
    }

    func grade(userAnswers: [String]) -> Int {
        var correctCounter = 0
        for (index, userAnswer) in userAnswers.enumerated() {
            correctCounter += userAnswer == correctAnswers[index] ? 1 : 0
        }
        
        return correctCounter
    }
}
