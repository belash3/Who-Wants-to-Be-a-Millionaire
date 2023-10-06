//
//  Game.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 17.05.2022.
//

import Foundation

final class Game {

    private let caretaker = GameCaretaker()
    static let shared = Game()
    private init() {
        sessionsArray = caretaker.loadResults() ?? []
    }
    var sessionsArray: [GameSession] {
        didSet {
            caretaker.saveResults(results: sessionsArray)
        }
    }
    
    
    var gameSession: GameSession?
    var selectedDifficulty: Difficulty = .medium
    var selectedQuestionStrategy: QuestionStrategyEnum = .serial
    
    var firstlyQuestionsArray = [question_1, question_2, question_3, question_4, question_5, question_6, question_7, question_8, question_9, question_10]
    
    var questionsArray: [Question] = []
    
    weak var gameSessionDelegate: GameSessionDelegate?
    
    func createQuestionStrategy() -> QuestionStrategy {
        switch self.selectedQuestionStrategy {
        case .serial:
            return SerialQuestionStrategy()
        case .random:
            return RandomQuestionStrategy()
        }
    }
    
    func createQuestionsArray() {
        let strategy = createQuestionStrategy()
        self.questionsArray = []
        self.questionsArray = strategy.getQuestions(self.firstlyQuestionsArray)
        print (self.questionsArray)
    }
}

extension Game: GameSessionDelegate {
    func answer(isRightAnswer: Bool) {
        if isRightAnswer {
            self.gameSession?.rightAnswers += 1
            self.gameSession?.currentQuestion += 1
        }
    }
}




private let question_1 = Question(question: "1. Чему равно число Пи?",
                          answers: ["31.4", "3.45", "3.14", "3.41"],
                          rightAnswer: "3.14")
private let question_2 = Question(question: "2. Что такое клетчатка?",
                          answers: ["Ткань", "Узор", "Пищевые волокна", "Матрица дисплея"],
                          rightAnswer: "Пищевые волокна")
private let question_3 = Question(question: "3. Как звали пушкинского Онегина?",
                          answers: ["Александр", "Евгений", "Иван", "Михаил"],
                          rightAnswer: "Евгений")
private let question_4 = Question(question: "4. Когда в России празднуют день ВМФ?",
                          answers: ["2 августа", "19 марта", "2-е воскресение июля", "Посл. воскресение июля"],
                          rightAnswer: "Посл. воскресение июля")
private let question_5 = Question(question: "5. Настоящие имя и фамилия солиста группы Сектор Газа?",
                          answers: ["Юрий Хой", "Юрий Шатунов", "Юрий Гагарин", "Юрий Клинских"],
                          rightAnswer: "Юрий Клинских")
private let question_6 = Question(question: "6. Кто живёт в Австралии?",
                          answers: ["Злыдня", "Хитрюга", "Дюдюка Барбидокская", "Ехидна"],
                          rightAnswer: "Ехидна")
private let question_7 = Question(question: "7. Чему равен периметр ромба со стороной 2 м?",
                          answers: ["4 метра", "6 литров", "8 метров квадратных", "8 метров"],
                          rightAnswer: "8 метров")
private let question_8 = Question(question: "8. Какое из этих женских имен в переводе с латинского означает 'Победа'?",
                          answers: ["Олимпиада", "Ноябрина", "Капитолина", "Виктория"],
                          rightAnswer: "Виктория")
private let question_9 = Question(question: "9. Что Пётр I велел брить всем боярам и дворянам?",
                          answers: ["Косы", "Ноги", "Брови", "Бороды"],
                          rightAnswer: "Бороды")
private let question_10 = Question(question: "10. Какое из этих ядер меньше всех остальных?",
                          answers: ["Пушечное", "Метательное", "Земное", "Атомное"],
                          rightAnswer: "Атомное")

    


