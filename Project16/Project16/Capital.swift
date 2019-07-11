//
//  Capital.swift
//  Project16
//
//  Created by Antoni on 11/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wikipedia: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, wikipedia: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wikipedia = wikipedia
    }
}
