//
//  Note.swift
//  Project-Consolidation8
//
//  Created by Antoni on 28/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import Foundation

class Note: Codable {
    var uuid: String
    var body: String
    var date: String
    
    init(uuid: String, body: String, date: String) {
        self.uuid = uuid
        self.body = body
        self.date = date
    }
}
