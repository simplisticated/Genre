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
    
    @IBOutlet fileprivate weak var actionOneButton: UIButton!
    
    @IBOutlet fileprivate weak var actionTwoButton: UIButton!
    
    @IBOutlet fileprivate weak var actionThreeButton: UIButton!
    
    // MARK: Object variables & properties
    
    let scenes = [
        Scene(
            sceneID: "initial",
            content: TextContent(
                text: "Hello, man!\nI came in peace."
            ),
            actions: [
                Action(
                    actionID: "say-hello-stranger",
                    text: "Hello, stranger.",
                    transitionTo: "final"
                ),
                Action(
                    actionID: "say-do-not-disturb-me",
                    text: "Hey, don't disturb me!",
                    transitionTo: "do-not-disturb"
                ),
                Action(
                    actionID: "ask-where-you-came-from",
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
            actions: [
                Action(
                    actionID: "say-go-away",
                    text: "Go away!",
                    transitionTo: "final"
                ),
                Action(
                    actionID: "say-i-am-here-for-war",
                    text: "I'm here for war.",
                    transitionTo: "final"
                ),
                Action(
                    actionID: "say-let-us-fight",
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
            actions: [
                Action(
                    actionID: "say-i-am-from-earth",
                    text: "Oh, cool! I'm from Earth.",
                    transitionTo: "final"
                ),
                Action(
                    actionID: "say-i-do-not-speak-with-aliens",
                    text: "I don't speak with aliens.",
                    transitionTo: "final"
                ),
                Action(
                    actionID: "say-go-away",
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
            actions: [
                Action(
                    actionID: "say-bye",
                    text: "Bye!",
                    transitionTo: "initial"
                ),
                Action(
                    actionID: "say-good-bye",
                    text: "Good bye.",
                    transitionTo: "initial"
                ),
                Action(
                    actionID: "say-well-bye",
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
    
    @IBAction func actionOneButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectAction(withIndex: 0, onScene: currentScene)
    }
    
    @IBAction func actionTwoButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectAction(withIndex: 1, onScene: currentScene)
    }
    
    @IBAction func actionThreeButtonDidTap(_ sender: Any) {
        guard let currentScene = self.sceneManager.lastDisplayedScene else {
            return
        }
        
        self.sceneManager.selectAction(withIndex: 2, onScene: currentScene)
    }
    
    // MARK: Protocol methods
    
    func willGo(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingActionWithIndex index: Int, onScene previousScene: Scene) {
    }
    
    func went(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingActionWithIndex index: Int, onScene previousScene: Scene) {
    }
    
    func display(scene: Scene, forManager manager: SceneManager) {
        self.sceneTextLabel.text = (scene.content as! TextContent).text
        self.actionOneButton.setTitle(scene.actions[0].text, for: [])
        self.actionTwoButton.setTitle(scene.actions[1].text, for: [])
        self.actionThreeButton.setTitle(scene.actions[2].text, for: [])
    }
    
}
