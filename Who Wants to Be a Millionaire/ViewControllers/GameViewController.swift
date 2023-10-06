//
//  GameViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 17.05.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    weak var gameSessionDelegate: GameSessionDelegate?
    var currentGameSession = GameSession()
    var currentShuffledAnswers: [String] = []
//    var questionsArray: [Question] = Game.shared.questionsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.gameSession = currentGameSession
        currentGameSession.currentQuestion = 0
        self.gameSessionDelegate = Game.shared
        self.currentShuffledAnswers = Game.shared.questionsArray[currentGameSession.currentQuestion].answers.shuffled()
        displayQuestion()
    }
    
    @IBAction func butoon1(_ sender: Any) {
        didTapAnswer(answer: 0, answers: currentShuffledAnswers)
    }
    @IBAction func button2(_ sender: Any) {
        didTapAnswer(answer: 1, answers: currentShuffledAnswers)
    }
    @IBAction func button3(_ sender: Any) {
        didTapAnswer(answer: 2, answers: currentShuffledAnswers)
    }
    @IBAction func button4(_ sender: Any) {
        didTapAnswer(answer: 3, answers: currentShuffledAnswers)
    }
    
    func displayQuestion() {
        let answers = self.currentShuffledAnswers
        questionLabel.text = Game.shared.questionsArray[currentGameSession.currentQuestion].question.description
        currentQuestionLabel.text = "Текущий вопрос: \(Game.shared.gameSession!.currentQuestion + 1)"
        moneyLabel.text = "Вы уже выиграли: $\(Game.shared.gameSession!.money)"
        answerButton1.setTitle(answers[0].description, for: UIControl.State.normal)
        answerButton2.setTitle(answers[1].description, for: UIControl.State.normal)
        answerButton3.setTitle(answers[2].description, for: UIControl.State.normal)
        answerButton4.setTitle(answers[3].description, for: UIControl.State.normal)
    }
    
    func didTapAnswer(answer: Int, answers: [String]) {
        

        if let currentQuestion = Game.shared.gameSession?.currentQuestion {
            if currentQuestion < Game.shared.questionsArray.count - 1 {
                let rightAnswer = Game.shared.questionsArray[currentGameSession.currentQuestion].rightAnswer.description
                let selectedAnswer = answers[answer].description
                if selectedAnswer == rightAnswer {
                    gameSessionDelegate?.answer(isRightAnswer: true)
                    self.currentShuffledAnswers = Game.shared.questionsArray[currentGameSession.currentQuestion].answers.shuffled()
                    displayQuestion()
                    
                } else {
                    Game.shared.sessionsArray.append(currentGameSession) // Добавляем результаты текущей игры в массив
                    Game.shared.gameSession = nil // Обнуляем сессию по завершению игры
                    dismiss(animated: true, completion: nil)
                }
            } else {
                Game.shared.sessionsArray.append(currentGameSession) // Добавляем результаты текущей игры в массив
                Game.shared.gameSession = nil // Обнуляем сессию по завершению игры
                dismiss(animated: true, completion: nil)
                print(Game.shared.sessionsArray.count)
            }
        }
    }
}

protocol GameSessionDelegate: AnyObject {
    func answer(isRightAnswer: Bool)
}

extension GameViewController: GameSessionDelegate {
    func answer(isRightAnswer: Bool) {}
}
