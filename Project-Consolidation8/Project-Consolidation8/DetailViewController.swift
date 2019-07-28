//
//  DetailViewController.swift
//  Project-Consolidation8
//
//  Created by Antoni on 28/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    
    func addNewNote(body: String?)
    
    func updateExistingNote(index: Int?, body: String?)
    
}

class DetailViewController: UIViewController {
    weak var delegate: ViewController?
    var index: Int?
    var body: String?
    var isEdit: Bool?
    
    let noteTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupDetailLayout()
        setupKeyboard()
        
        guard let isEdit = isEdit else { return }
        if isEdit {
            loadExistingNote()
        }
    }
    
    func setupKeyboard() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
    }
    
    func setupDetailLayout() {
        view.addSubview(noteTextView)
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        noteTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        noteTextView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
    
    func loadExistingNote() {
        guard let body = body else { return }
        noteTextView.text = body
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            noteTextView.contentInset = .zero
        } else {
            noteTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        noteTextView.scrollIndicatorInsets = noteTextView.contentInset
        
        let selectedRange = noteTextView.selectedRange
        noteTextView.scrollRangeToVisible(selectedRange)
    }
    
    @objc func doneTapped() {
        guard let isEdit = isEdit else { return }
        
        if isEdit == true {
            guard let index = index else { return }
            delegate?.updateExistingNote(index: index, body: noteTextView.text)
        } else {
            delegate?.addNewNote(body: noteTextView.text)
        }
        
        
        navigationController?.popViewController(animated: true)
    }
    
}
