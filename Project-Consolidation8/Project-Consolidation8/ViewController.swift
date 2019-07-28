//
//  ViewController.swift
//  Project-Consolidation8
//
//  Created by Antoni on 28/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DetailViewControllerDelegate {
    
    var notes = [Note]()
    let cellId = "NoteCell"
    let tableView = UITableView()
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        loadNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        
    }

    
    func setupNavigation() {
        title = "Notes"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Set the shadow color.
        navigationController?.navigationBar.shadowImage = UIColor.gray.as1ptImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showAddNoteForm))
    }
    
    func setupTableView() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoteCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 80.0
        tableView.backgroundColor = .black
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
//        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.tableFooterView = UIView()

        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func updateExistingNote(index: Int?, body: String?) {
        guard let index = index else { return }
        guard let body = body else { return }
        notes[index].body = body
        saveNote()
        tableView.reloadData()
    }
    
    func saveNote() {
        let jsonEncoder = JSONEncoder()
        
        if let savedNotes = try? jsonEncoder.encode(notes) {
            defaults.set(savedNotes, forKey: "SavedNotes")
        } else {
            print("Failed to save notes.")
        }
    }
    
    func loadNotes() {
        if let savedNotes = defaults.object(forKey: "SavedNotes") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                notes = try jsonDecoder.decode([Note].self, from: savedNotes)
                notes.sort { $0.date > $1.date }
            } catch {
                print("Failed to load notes")
            }
            
            tableView.reloadData()
        }
    }
    
    func addNewNote(body: String?) {
        let date = Date()
        let customDate = DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .none)
        guard let body = body else { return }
        
        let newNote = Note(uuid: UUID().uuidString, body: body, date: customDate)
        notes.append(newNote)
        saveNote()
        tableView.reloadData()
    }
    
    @objc func showAddNoteForm() {
        let vc = DetailViewController()
        vc.delegate = self
        vc.isEdit = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailViewController()
        vc.isEdit = true
        vc.index = indexPath.row
        vc.body = notes[indexPath.row].body
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveNote()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.red
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NoteCell
        cell.titleLabel.text = String(notes[indexPath.row].body.prefix(10))
        cell.dateLabel.text = notes[indexPath.row].date
        cell.layoutMargins = UIEdgeInsets.zero
        cell.backgroundColor = .black
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
}

extension UIColor {
    
    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
