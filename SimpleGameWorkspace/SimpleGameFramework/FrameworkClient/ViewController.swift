//
//  ViewController.swift
//  FrameworkClient
//
//  Created by RODRIGO FRANCISCO PABLO on 25/11/24.
//

import UIKit
import SimpleGameFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gameCharacter = GameCharacter(name: "A character")
        
        print(gameCharacter.name)
        
        let level = Level()
        
        level.add(gameCharacter)
        level.add(GameCharacter(name: "rod"))
        
        let characters = level.allGameCharacters()
        
        for character in characters {
            print(character.name)
        }
    }
}
