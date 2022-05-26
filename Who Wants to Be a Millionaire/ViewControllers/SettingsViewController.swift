//
//  SettingsViewController.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 23.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var randomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var difficultySegmentalControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch difficultySegmentalControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .medium
        case 2:
            return .hard
        default:
            return .medium
        }
    }
    
    private var selectedRandom: QuestionStrategyEnum {
        switch randomSegmentedControl.selectedSegmentIndex {
        case 0:
            return .serial
        case 1:
            return .random
        default:
            return .serial
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Отображаем сохраненную настройку
        self.randomSegmentedControl.selectedSegmentIndex = {
            switch Game.shared.selectedQuestionStrategy {
            case .serial: return 0
            case .random: return 1
            }
        }()
    }
    override func viewDidDisappear(_ animated: Bool) {
        Game.shared.selectedQuestionStrategy = self.selectedRandom
        Game.shared.createQuestionsArray()
    }
}
