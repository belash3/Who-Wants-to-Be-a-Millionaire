//
//  Game.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 17.05.2022.
//

import Foundation

final class Game {
    static let game = Game()
    private init() {}
    
    var gameSession: GameSession?
    var questionsArray = [question_1, question_2, question_3, question_4, question_5, question_6, question_7, question_8, question_9, question_10]
    
}

private let question_1 = Question(question: "Чему равно число Пи?",
                          answers: ["31.4", "3.45", "3.14", "3.41"],
                          rightAnswer: "3.14")
private let question_2 = Question(question: "Что такое клетчатка?",
                          answers: ["Ткань", "Узор", "Пищевые волокна", "Матрица дисплея"],
                          rightAnswer: "Пищевые волокна")
private let question_3 = Question(question: "Как звали пушкинского Онегина?",
                          answers: ["Александр", "Евгений", "Иван", "Михаил"],
                          rightAnswer: "Евгений")
private let question_4 = Question(question: "Когда в России празднуют день ВМФ?",
                          answers: ["2 августа", "19 марта", "2-е воскресение июля", "Посл. воскресение июля"],
                          rightAnswer: "Посл. воскресение июля")
private let question_5 = Question(question: "Настоящие имя и фамилия солиста группы Сектор Газа?",
                          answers: ["Юрий Хой", "Юрий Шатунов", "Юрий Гагарин", "Юрий Клинских"],
                          rightAnswer: "Юрий Клинских")
private let question_6 = Question(question: "Кто живёт в Австралии?",
                          answers: ["Злыдня", "Хитрюга", "Дюдюка Барбидокская", "Ехидна"],
                          rightAnswer: "Ехидна")
private let question_7 = Question(question: "Чему равен периметр ромба со стороной 2 м?",
                          answers: ["4 метра", "6 литров", "8 метров квадратных", "8 метров"],
                          rightAnswer: "8 метров")
private let question_8 = Question(question: "Какое из этих женских имен в переводе с латинского означает 'Победа'?",
                          answers: ["Олимпиада", "Ноябрина", "Капитолина", "Виктория"],
                          rightAnswer: "Виктория")
private let question_9 = Question(question: "Что Пётр I велел брить всем боярам и дворянам?",
                          answers: ["Косы", "Ноги", "Брови", "Бороды"],
                          rightAnswer: "Бороды")
private let question_10 = Question(question: "Какое из этих ядер меньше всех остальных?",
                          answers: ["Пушечное", "Метательное", "Земное", "Атомное"],
                          rightAnswer: "Атомное")

    


