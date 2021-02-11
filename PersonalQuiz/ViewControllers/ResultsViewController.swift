//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answersChoosen: [Answer] = []
    
    // Передать сюда массив с ответами
    // Определить наиболее часто встречающийся тип животного
    // Отобразить результат в соответсвии с этим животным.

    @IBOutlet var nameAnimalLabel: UILabel!
    
    @IBOutlet var discriptionAnimalLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultDifnition = animalCount()
        
        guard let dog = resultDifnition["Dog"] else { return }
        guard let cat = resultDifnition["Cat"] else { return }
        guard let rabbit = resultDifnition["Rabbit"] else { return }
        guard let turtle = resultDifnition["Turtle"] else { return }
        
        let finich = result(dog: dog, cat: cat, rabbit: rabbit, turtle: turtle)
            
        nameAnimalLabel.text = ("Вы \(finich[0])")
        discriptionAnimalLabel.text = finich[1]
        print(resultDifnition)
    }
    
    private func animalCount() -> [String: Int] {
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for animal in answersChoosen {
            if animal.type == .dog {
                dog += 1
                
            } else if animal.type == .cat {
                cat += 1
                
            } else if animal.type == .rabbit {
                rabbit += 1
                
            } else if animal.type == .turtle {
                turtle += 1
                
            }
 
        }
        
        return ["Dog": dog, "Cat": cat, "Rabbit": rabbit, "Turtle": turtle]
        
       }
    
    private func result(dog: Int, cat: Int, rabbit: Int, turtle: Int) -> [String] {

                var result = ""
                var resultDifnition = ""
        
                if dog > cat && dog > rabbit && dog > turtle {
                    result = AnimalType.dog.rawValue
                    resultDifnition = AnimalType.dog.definition
                } else if cat > dog && cat > rabbit && cat > turtle {
                    result = AnimalType.cat.rawValue
                    resultDifnition = AnimalType.cat.definition
                } else if rabbit > dog && rabbit > cat && rabbit > turtle {
                    result = AnimalType.rabbit.rawValue
                    resultDifnition = AnimalType.rabbit.definition
                }  else if turtle > dog && turtle > rabbit && turtle > cat {
                    result = AnimalType.turtle.rawValue
                    resultDifnition = AnimalType.turtle.definition
    }
        return [result, resultDifnition]
    }
}
