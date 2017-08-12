//
//  MainViewController.swift
//  GenreDemo
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit
import Genre

class MainViewController: UIViewController, SceneManagerUIDelegate {

    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    @IBOutlet fileprivate weak var sceneTextLabel: UILabel!
    
    @IBOutlet fileprivate weak var optionOneButton: UIButton!
    
    @IBOutlet fileprivate weak var optionTwoButton: UIButton!
    
    @IBOutlet fileprivate weak var optionThreeButton: UIButton!
    
    // MARK: Object variables & properties
    
    let scenes = [
        Scene(
            sceneID: "initial",
            text: "Hello",
            image: nil,
            options: [
                Option(
                    optionID: "say-hi",
                    text: "Hi",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-hey",
                    text: "Hey",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-hey-there",
                    text: "Hey there",
                    transitionTo: "final"
                ),
            ]
        ),
        Scene(
            sceneID: "final",
            text: "Bye",
            image: nil,
            options: [
                Option(
                    optionID: "say-bye",
                    text: "Bye!",
                    transitionTo: "initial"
                ),
                Option(
                    optionID: "say-good-bye",
                    text: "Good bye.",
                    transitionTo: "initial"
                ),
                Option(
                    optionID: "say-well-bye",
                    text: "Well, bye.",
                    transitionTo: "initial"
                ),
            ]
        ),
    ]
    
    fileprivate var sceneManager: SceneManager!
    
    fileprivate var currentScene: Scene?
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize scene manager
        
        self.sceneManager = SceneManager(scenes: self.scenes)
        self.sceneManager.UIDelegate = self
        self.sceneManager.start(withSceneID: "initial")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    @IBAction func optionOneButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectOption(withIndex: 0, onScene: currentScene)
    }
    
    @IBAction func optionTwoButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectOption(withIndex: 1, onScene: currentScene)
    }
    
    @IBAction func optionThreeButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectOption(withIndex: 2, onScene: currentScene)
    }
    
    // MARK: Protocol methods
    
    func display(scene: Scene, forManager manager: SceneManager) {
        self.sceneTextLabel.text = scene.text ?? ""
        self.optionOneButton.setTitle(scene.options[0].text, for: [])
        self.optionTwoButton.setTitle(scene.options[1].text, for: [])
        self.optionThreeButton.setTitle(scene.options[2].text, for: [])
    }
    
}
