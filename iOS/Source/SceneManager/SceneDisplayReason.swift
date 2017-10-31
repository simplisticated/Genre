//
//  SceneDisplayReason.swift
//  Genre
//
//  Created by Igor Matyushkin on 01.11.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum SceneDisplayReason {
    case initialScene
    case didSelect(actionIndex: Int, previousScene: Scene)
}
