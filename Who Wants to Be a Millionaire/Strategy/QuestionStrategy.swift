//
//  RandomQuestionStrategy.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 23.05.2022.
//

import Foundation

protocol QuestionStrategy {
    func getQuestions(_ questionsArray: [Question]) -> [Question]
}

class SerialQuestionStrategy: QuestionStrategy {
    func getQuestions(_ questionsArray: [Question]) -> [Question] {
        questionsArray
    }
}

class RandomQuestionStrategy: QuestionStrategy {
    func getQuestions(_ questionsArray: [Question]) -> [Question] {
        questionsArray.shuffled()
    }
    
    
}
