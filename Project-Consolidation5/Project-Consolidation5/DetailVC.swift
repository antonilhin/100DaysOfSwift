//
//  DetailVC.swift
//  Project-Consolidation5
//
//  Created by Antoni on 25/06/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imagePath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(contentsOfFile: imagePath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
