//
//  SceneManagerDelegate.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public protocol SceneManagerDelegate: class {
    
    func display(scene: Scene, forManager manager: SceneManager, byReason reason: SceneDisplayReason)
    
}
