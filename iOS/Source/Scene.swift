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
    public var text: String?
    public var image: UIImage?
    public var options: [Option]
    
    public init(
        sceneID: String,
        text: String?,
        image: UIImage?,
        options: [Option]
    ) {
        self.sceneID = sceneID
        self.text = text
        self.image = image
        self.options = options
    }
}
