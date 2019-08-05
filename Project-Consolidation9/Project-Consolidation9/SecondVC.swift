//
//  SecondVC.swift
//  Project-Consolidation9
//
//  Created by Antoni on 05/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var timesButton: UIButton!
    
    var alertView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "Extend Int"
       navigationItem.largeTitleDisplayMode = .never

        timesButton.layer.masksToBounds = true
        timesButton.layer.cornerRadius = timesButton.bounds.height/2.0
    }
    
    @IBAction func timesAction(_ sender: Any) {
        
        if let v = Int(numberTextField.text!) {
            var countText = ""
            v.times {
                countText += "Hello! \n"
            }
            
            alertView = UIView()
            alertView?.backgroundColor = .white
            alertView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
            
            let label = UILabel(frame: alertView!.frame)
            label.textAlignment = .center
            label.text = countText
            label.textColor = .black
            label.numberOfLines = 0
            alertView?.addSubview(label)
            let tap = UITapGestureRecognizer(target: self, action: #selector(closeview))
            alertView?.addGestureRecognizer(tap)
            self.view.addGestureRecognizer(tap)
            alertView?.center = view.center
            self.view.addSubview(alertView!)
            
        }
    }
    
    @objc func closeview() {
        alertView?.removeFromSuperview()
        alertView = nil
    }
    

}

extension Int {
    func times(_ clousure: () -> Void) {
        guard self > 0 else { return }
        for _ in 0..<self {
            clousure()
        }
    }
}
