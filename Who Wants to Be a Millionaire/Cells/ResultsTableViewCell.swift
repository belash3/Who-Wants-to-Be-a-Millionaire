//
//  ResultsTableViewCell.swift
//  Who Wants to Be a Millionaire
//
//  Created by Сергей Беляков on 22.05.2022.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var percentOfRightAnswersLabel: UILabel!
    @IBOutlet weak var rightAnswersLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    override func prepareForReuse() {
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func clearCell() {
        percentOfRightAnswersLabel.text = ""
        rightAnswersLabel.text = ""
        moneyLabel.text = ""
    }
    
    func configure(percent: Double, rightAnswers: Int, money: Int) {
        self.percentOfRightAnswersLabel.text = "\(percent)%"
        self.rightAnswersLabel.text = "\(rightAnswers)"
        self.moneyLabel.text = "\(money)"
    }
}
