//
//  Person.swift
//  Project10
//
//  Created by Antoni on 13/6/19.
//  Copyright © 2019 OneByOne. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
}
