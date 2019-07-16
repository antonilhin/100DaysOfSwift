//
//  ViewController.swift
//  Project18
//
//  Created by Antoni on 16/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Print
        print(1, 2, 3, 4, 5, separator: "-")
        print("Some message", terminator: "")
        
        // Assert
        assert(1 == 1, "Maths failure!")
//        assert(1 == 2, "Maths failure!")
//        assert(myReallySlowMethod() == true, "The slow method returned false, which is a bad thing!")
        
        // Break Points
        for i in 1...100 {
            print("Got number \(i).")
        }
    }


}

