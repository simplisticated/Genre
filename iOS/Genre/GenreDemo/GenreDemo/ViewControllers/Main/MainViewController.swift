//
//  MainViewController.swift
//  GenreDemo
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit
import Genre

class MainViewController: UIViewController, SceneManagerLogicDelegate, SceneManagerUIDelegate {

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
            content: TextContent(
                text: "Hello, man!\nI came in peace."
            ),
            options: [
                Option(
                    optionID: "say-hello-stranger",
                    text: "Hello, stranger.",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-do-not-disturb-me",
                    text: "Hey, don't disturb me!",
                    transitionTo: "do-not-disturb"
                ),
                Option(
                    optionID: "ask-where-you-came-from",
                    text: "Hello! Where you came from?",
                    transitionTo: "location"
                ),
            ],
            userInfo: nil
        ),
        Scene(
            sceneID: "do-not-disturb",
            content: TextContent(
                text: "Ok, sorry."
            ),
            options: [
                Option(
                    optionID: "say-go-away",
                    text: "Go away!",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-i-am-here-for-war",
                    text: "I'm here for war.",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-let-us-fight",
                    text: "Let's fight.",
                    transitionTo: "final"
                ),
            ],
            userInfo: nil
        ),
        Scene(
            sceneID: "location",
            content: TextContent(
                text: "I'm from the Moon."
            ),
            options: [
                Option(
                    optionID: "say-i-am-from-earth",
                    text: "Oh, cool! I'm from Earth.",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-i-do-not-speak-with-aliens",
                    text: "I don't speak with aliens.",
                    transitionTo: "final"
                ),
                Option(
                    optionID: "say-go-away",
                    text: "Go away! Earth is for humans!",
                    transitionTo: "final"
                ),
            ],
            userInfo: nil
        ),
        Scene(
            sceneID: "final",
            content: TextContent(
                text: "Bye"
            ),
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
            ],
            userInfo: nil
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
    
    func willGo(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingOptionWithIndex index: Int, onScene previousScene: Scene) {
    }
    
    func went(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingOptionWithIndex index: Int, onScene previousScene: Scene) {
    }
    
    func display(scene: Scene, forManager manager: SceneManager) {
        self.sceneTextLabel.text = (scene.content as! TextContent).text
        self.optionOneButton.setTitle(scene.options[0].text, for: [])
        self.optionTwoButton.setTitle(scene.options[1].text, for: [])
        self.optionThreeButton.setTitle(scene.options[2].text, for: [])
    }
    
}
