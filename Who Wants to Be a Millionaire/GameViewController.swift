//
//  GameViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 17.05.2022.
//

import UIKit

class GameViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    var gameSession = GameSession()
    weak var gameSessionDelegate: GameSessionDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    



}

protocol GameSessionDelegate: AnyObject {
    func answer(answer: Int)
}
