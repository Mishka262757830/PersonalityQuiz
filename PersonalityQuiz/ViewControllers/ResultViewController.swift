//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Mikhail Stepanov on 20.02.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // передать массив с ответами (answerChosen)
    // определить наиболее часто встречающийся тип животного
    // отобразить результаты в соответсятвии с этим животным
    // избавить от кнопки возврата на предыдущий экран
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultText: UILabel!
    
    var results: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        getResult()
    }
    
    private func getResult() {
        var doubleAnimals: [Animal: Int] = [:]
        
        let animals = results.map({$0.animal})
        
        for animal in animals {
            if let existingAnimal = doubleAnimals[animal] {
                doubleAnimals.updateValue(existingAnimal + 1, forKey: animal)
            } else {
                doubleAnimals[animal] = 1
            }
        }
        
        let sortedAnimals = doubleAnimals.sorted {$0.value > $1.value}
        guard let repeatedAnimal = sortedAnimals.first?.key else {return}
        
        updateUserResult(with: repeatedAnimal)
    }
    
    private func updateUserResult(with animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)!"
        resultText.text = animal.definition
    }
    
}
