//
//  ViewController.swift
//  Project12
//
//  Created by Antoni on 22/06/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseFaceID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        defaults.set("Antoni", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = ["Name": "Antoni", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDictionary")
        
        let savedInteger = defaults.integer(forKey:"Age")
        let savedBoolean = defaults.bool(forKey: "UseFaceID")
        
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        
        let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String: String]()
        
        
    }


}

