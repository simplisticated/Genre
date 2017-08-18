//
//  Action.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public struct Action {
    public var actionID: String
    public var text: String
    public var transitionTo: String?
    
    public init(
        actionID: String,
        text: String,
        transitionTo: String?
    ) {
        self.actionID = actionID
        self.text = text
        self.transitionTo = transitionTo
    }
}
