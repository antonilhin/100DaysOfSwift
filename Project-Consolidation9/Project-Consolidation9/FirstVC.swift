//
//  FirstVC.swift
//  Project-Consolidation9
//
//  Created by Antoni on 05/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {


    @IBOutlet var bounceView: UIImageView!
    @IBOutlet var bounceButton: UIButton!
    
    var  isBounseOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Extend UIView"
        navigationItem.largeTitleDisplayMode = .never

        
        bounceButton.layer.masksToBounds = true
        bounceButton.layer.cornerRadius = bounceButton.bounds.height/2.0
    }
    
    @IBAction func bounceButton(_ sender: UIButton) {
        if !isBounseOut {
            bounceView.bounceOut(duration: 1.0)
        } else {
            bounceView.bounceIn(duration: 1.0)
        }
        isBounseOut = !isBounseOut
        
    }
    

}

extension UIView {
    func bounceOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        }
    }
    func bounceIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
}
