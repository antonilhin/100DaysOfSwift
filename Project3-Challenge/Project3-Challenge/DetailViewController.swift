//
//  DetailViewController.swift
//  Project3-Challenge
//
//  Created by Antoni on 29/4/19.
//  Copyright © 2019 OneByOne. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            title = selectedImage?.uppercased()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped() {
        guard let image = imageView?.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let messageStr = "Flag of \(selectedImage)"        
        let vc = UIActivityViewController(activityItems: [image, messageStr], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    

}
