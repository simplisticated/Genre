//
//  ImageContent.swift
//  Genre
//
//  Created by Igor Matyushkin on 12.08.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ImageContent: BaseContent {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(image: UIImage) {
        super.init()
        
        // Initialize image
        
        self._image = image
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _image: UIImage!
    
    public var image: UIImage {
        get {
            return _image
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}
