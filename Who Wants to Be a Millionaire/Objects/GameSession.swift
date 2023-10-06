//
//  GameSession.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 17.05.2022.
//

import Foundation
import UIKit

class GameSession: Codable {
    var rightAnswers = 0
    var numberOfQuestions = 10
    var currentQuestion = 0
    var percentOfRightAnswers: Double {
        get {
            Double(rightAnswers) / Double(numberOfQuestions) * 100
        }
    }
    var money: Int {
        get {
            currentQuestion * currentQuestion * currentQuestion * 1000
        }
    }
}
