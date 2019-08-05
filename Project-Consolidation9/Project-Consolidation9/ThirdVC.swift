//
//  ThirdVC.swift
//  Project-Consolidation9
//
//  Created by Antoni on 05/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var removeButton: UIButton!
    
    var stringArray = ["Ferrari", "Porche", "Lamborghini", "Audi","Bugatti"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Extend Array"
        navigationItem.largeTitleDisplayMode = .never

        
        removeButton.layer.masksToBounds = true
        removeButton.layer.cornerRadius = removeButton.bounds.height/2.0
        
        reloadLabel()
    }
    
    func reloadLabel() {
        var str = ""
        for item in stringArray {
            str += item + "\n"
        }
        self.itemLabel.text = str
    }
    
    @IBAction func removeAction(_ sender: UIButton) {
        
        let str = itemTextField.text!
        stringArray.remove(str)
        reloadLabel()
        itemTextField.text = ""
        
    }
    


}

extension Array where Element: Comparable {
    mutating func remove(_ item: Element) {
        if let location = self.firstIndex(of: item) {
            self.remove(at: location)
        }
    }
}
