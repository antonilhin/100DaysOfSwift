//
//  ViewController.swift
//  Project-Consolidation5
//
//  Created by Antoni on 25/06/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoArray = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        
        title = "Project - Consolidation 5"
        
        let defaults = UserDefaults.standard
        if let savedData = defaults.object(forKey: "photo") as? Data {
            if let decodePeople = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [PhotoModel] ?? [PhotoModel]() {
                photoArray = decodePeople
            }
        }
    }
    
    @objc func addPhoto() {
        let actions = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        actions.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .camera
            self?.present(picker, animated: true, completion: nil)
        }))
        
        actions.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { [weak self] _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            self?.present(picker, animated: true, completion: nil)
        }))
        
        if let popoverController = actions.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []

        }
        present(actions, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let imageName = UUID().uuidString
        let path = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpgData = image.jpegData(compressionQuality: 1.0) {
            try? jpgData.write(to: path)
        }
   
        let p = PhotoModel(name: "", image: path.path)
        photoArray.insert(p, at: 0)
        tableView.insertRows(at: [IndexPath(item: 0, section: 0)], with: .automatic)
        
        
        picker.dismiss(animated: true, completion: {
            let ac = UIAlertController(title: "Caption", message: "Enter caption", preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak ac, weak self] _ in
                guard let str = ac?.textFields?[0].text else { return }
                self?.photoArray[0].name = str
                self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                self?.saveData()
            }))
            self.present(ac, animated: true, completion: nil)
        });
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { fatalError() }
        let model = photoArray[indexPath.row]
        
        cell.nameLabel.text = model.name
        cell.photoView.image = UIImage(contentsOfFile: model.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        controller.imagePath = photoArray[indexPath.row].image
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func saveData() {
        if let archiveData = try? NSKeyedArchiver.archivedData(withRootObject: photoArray, requiringSecureCoding: false) {
            UserDefaults.standard.set(archiveData, forKey: "photo")
            UserDefaults.standard.synchronize()
        }
    }
    
}

