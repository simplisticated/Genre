//
//  TextContent.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public class TextContent: BaseContent {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(text: String) {
        super.init()
        
        // Initialize text
        
        self._text = text
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _text: String!
    
    public var text: String {
        get {
            return _text
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
