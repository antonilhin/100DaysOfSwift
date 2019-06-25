//
//  PhotoModel.swift
//  Project-Consolidation5
//
//  Created by Antoni on 25/06/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class PhotoModel: NSObject, NSCoding {

    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.image, forKey: "image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.image = aDecoder.decodeObject(forKey: "image") as? String ?? ""

    }
    
}
