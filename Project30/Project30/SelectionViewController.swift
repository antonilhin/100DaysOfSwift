//
//  SelectionViewController.swift
//  Project30
//
//  Created by TwoStraws on 20/08/2016.
//  Copyright (c) 2016 TwoStraws. All rights reserved.
//

import UIKit

class SelectionViewController: UITableViewController {
    var items = [String]() // this is the array that will store the filenames to load
    var dirty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Reactionist"
        
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // load all the JPEGs into our array
        let fm = FileManager.default
        
        if let tempItems = try? fm.contentsOfDirectory(atPath: Bundle.main.resourcePath!) {
            for item in tempItems {
                if item.range(of: "Large") != nil {
                    items.append(item)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if dirty {
            // we've been marked as needing a counter reload, so reload the whole table
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return items.count * 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentImage = items[indexPath.row % items.count]
        let renderRect = CGRect(origin: .zero, size: CGSize(width: 90, height: 90))
        
        
        cell.imageView?.image = imageLoader(row: indexPath.row, currentImage: currentImage)
        
        // give the images a nice shadow to make them look a bit more dramatic
        cell.imageView?.layer.shadowColor = UIColor.black.cgColor
        cell.imageView?.layer.shadowOpacity = 1
        cell.imageView?.layer.shadowRadius = 10
        cell.imageView?.layer.shadowOffset = CGSize.zero
        cell.imageView?.layer.shadowPath = UIBezierPath(ovalIn: renderRect).cgPath
        
        // each image stores how often it's been tapped
        let defaults = UserDefaults.standard
        cell.textLabel?.text = "\(defaults.integer(forKey: currentImage))"
        
        return cell
    }
    
    func imageLoader(row: Int, currentImage: String) -> UIImage {
        let imageRootName = currentImage.replacingOccurrences(of: "Large", with: "Thumb")
        if let imageData = try? Data(contentsOf: getDocumentsDirectory().appendingPathComponent(imageRootName)) {
            return UIImage(data: imageData)!
        }
        
        guard let path = Bundle.main.path(forResource: imageRootName, ofType: nil)  else {fatalError()}
        guard let original = UIImage(contentsOfFile: path) else {fatalError()}
        
        let renderRect = CGRect(origin: .zero, size: CGSize(width: 90, height: 90))
        
        let renderer = UIGraphicsImageRenderer(size:renderRect.size)
        
        let rounded = renderer.image { ctx in
            ctx.cgContext.addEllipse(in: renderRect)
            ctx.cgContext.clip()
            
            original.draw(in: renderRect)
        }
        if let pngData = rounded.pngData() {
            try? pngData.write(to: getDocumentsDirectory().appendingPathComponent(imageRootName))
        }
        return rounded
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageViewController()
        vc.image = items[indexPath.row % items.count]
        vc.owner = self
        
        // mark us as not needing a counter reload when we return
        dirty = false
        navigationController!.pushViewController(vc, animated: true)
    }
}