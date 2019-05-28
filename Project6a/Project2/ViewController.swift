//
//  ViewController.swift
//  Project2
//
//  Created by Antoni on 25/4/19.
//  Copyright © 2019 OneByOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var contries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        contries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func win() {
        if score == 10 {
            let ac = UIAlertController(title: "You win", message: "Play again ?", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
            
            score = 0
        } else {
            print("Try again")
        }
    }
    
    func titleLabel() {
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.text = "\(contries[correctAnswer].uppercased())\nYour Score is \(score)"
        self.navigationItem.titleView = label

    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        contries.shuffle()
        print(contries)
     
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        
        titleLabel()
        win()
        
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
                
        if sender.tag == correctAnswer{
            title = "Correct"
            message = ""
            score += 1
        } else {
            title = "Wrong!"
            message = "That's the flag of \(contries[sender.tag].uppercased())"
            score -= 1
        }

        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)

        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

        present(ac, animated: true)
    }
    
}

