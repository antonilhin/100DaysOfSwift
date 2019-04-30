//
//  ViewController.swift
//  Project3-Challenge
//
//  Created by Antoni on 29/4/19.
//  Copyright © 2019 OneByOne. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    var contries = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        
        title = "Flags"
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.imageView?.image = UIImage(named: contries[indexPath.row])
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
        cell.textLabel?.text = contries[indexPath.row].uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = contries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }



}

