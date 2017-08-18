//
//  Scene.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public struct Scene {
    public var sceneID: String
    public var content: BaseContent
    public var actions: [Action]
    public var userInfo: [String : Any]?
    
    public init(
        sceneID: String,
        content: BaseContent,
        actions: [Action],
        userInfo: [String : Any]?
    ) {
        self.sceneID = sceneID
        self.content = content
        self.actions = actions
        self.userInfo = userInfo
    }
}
