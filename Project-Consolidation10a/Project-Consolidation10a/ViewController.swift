//
//  ViewController.swift
//  Project-Consolidation10a
//
//  Created by Antoni on 14/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    var image: UIImage?
    var topMessage = ""
    var bottomMessage = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(memeShare))
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        title = "Meme Generator"
        
    }
    
    @objc func memeShare() {
        
        let activity = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
        
    }
    
    
    @objc func addPhoto() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let img = info[.editedImage] as? UIImage else { return }
        image = img
        picker.dismiss(animated: true, completion:  {
            self.alert(isTop: true)
        })
        
    }
    
    func alert(isTop: Bool) {
        
        var title = "Add top caption"
        if !isTop {
            title = "Add bottom caption"
        }
        
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self, weak ac] _ in
            guard let message = ac?.textFields![0].text else { fatalError() }
            if isTop {
                self?.topMessage = message
                self?.alert(isTop: false)
            } else {
                self?.bottomMessage = message
                self?.drawMem()
            }
        }))
        present(ac, animated: true)
        
    }
    
    func drawMem() {
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 650))
        
        let img = renderer.image { context in
            image?.draw(in: CGRect(x: 0, y: 50, width: 512, height: 550))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            
            let attributedString = NSAttributedString(string: topMessage, attributes: attrs)
            attributedString.draw(with: CGRect(x: 20, y: 50, width: 470, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let attributedString2 = NSAttributedString(string: bottomMessage, attributes: attrs)
            attributedString2.draw(with: CGRect(x: 20, y: 550, width: 470, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
        }
        
        imageView.image = img
    }


}

