//
//  SceneManagerLogicDelegate.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

/**
 This protocol is experimental.
 Not guaranteed to be supported in next versions.
 */
public protocol SceneManagerLogicDelegate: class {
    
    func willGo(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingOptionWithIndex index: Int, onScene previousScene: Scene)
    
    func went(toScene scene: Scene, withManager manager: SceneManager, asAResultOfSelectingOptionWithIndex index: Int, onScene previousScene: Scene)
    
}
