//
//  SceneManager.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SceneManager: NSObject {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(scenes: [Scene]) {
        super.init()
        
        // Initialize scenes collection
        
        self.scenes = scenes
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var scenes: [Scene]!
    
    public var numberOfScenes: Int {
        get {
            return scenes.count
        }
    }
    
    fileprivate var _lastDisplayedScene: Scene?
    
    public var lastDisplayedScene: Scene? {
        get {
            return self._lastDisplayedScene
        }
    }
    
    public weak var logicDelegate: SceneManagerLogicDelegate?
    
    public weak var UIDelegate: SceneManagerUIDelegate?
    
    // MARK: Public object methods
    
    public func start(withSceneID sceneID: String) {
        guard let initialScene = findScene(withID: sceneID) else {
            return
        }
        
        guard self.UIDelegate != nil else {
            return
        }
        
        self.UIDelegate!.display(scene: initialScene, forManager: self)
        self._lastDisplayedScene = initialScene
    }
    
    public func selectOption(withIndex index: Int, onScene scene: Scene) {
        let selectedOption = scene.options[index]
        
        guard let nextSceneID = selectedOption.transitionTo else {
            return
        }
        
        guard let nextScene = self.findScene(withID: nextSceneID) else {
            return
        }
        
        guard self.UIDelegate != nil else {
            return
        }
        
        self.logicDelegate?.willGo(toScene: nextScene, withManager: self, asAResultOfSelectingOptionWithIndex: index, onScene: scene)
        
        self.UIDelegate!.display(scene: nextScene, forManager: self)
        self._lastDisplayedScene = nextScene
        
        self.logicDelegate?.went(toScene: nextScene, withManager: self, asAResultOfSelectingOptionWithIndex: index, onScene: scene)
    }
    
    // MARK: Private object methods
    
    fileprivate func findScene(withIndex index: Int) -> Scene? {
        return self.scenes[index]
    }
    
    fileprivate func findScene(withID sceneID: String) -> Scene? {
        return self.scenes.filter({ (scene) -> Bool in
            return scene.sceneID == sceneID
        }).first
    }
    
    // MARK: Protocol methods
    
}
