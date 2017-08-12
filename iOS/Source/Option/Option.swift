//
//  Option.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public struct Option {
    public var optionID: String
    public var text: String
    public var transitionTo: String?
    
    public init(
        optionID: String,
        text: String,
        transitionTo: String?
    ) {
        self.optionID = optionID
        self.text = text
        self.transitionTo = transitionTo
    }
}
