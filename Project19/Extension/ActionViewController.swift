//
//  ActionViewController.swift
//  Extension
//
//  Created by Antoni on 21/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet var script: UITextView!
    
    var pageTitle = ""
    var pageURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(chooseAction))
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = inputItem.attachments?.first {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [weak self] (dict, Error) in
                    guard let itemDictionary = dict as? NSDictionary else { return }
                    guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
                    
                    self?.pageTitle = javaScriptValues["title"] as? String ?? ""
                    self?.pageURL = javaScriptValues["URL"] as? String ?? ""
                    
                    DispatchQueue.main.async {
                        self?.title = self?.pageTitle
                    }
                }
            }
        }
    
    }
    
    @objc func chooseAction() {
        
        let ac = UIAlertController(title: "Useful scripts", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Show Title", style: .default, handler: { [weak self] _ in
            self?.script.text = "alert(document.title);"
        }))
        ac.addAction(UIAlertAction(title: "Show URL", style: .default, handler: { [weak self] _ in
            self?.script.text = "alert(document.URL);"
        }))
        ac.addAction(UIAlertAction(title: "Show Last Modified", style: .default, handler: { [weak self] _ in
            self?.script.text = "alert(document.lastModified);"
            }))
        ac.addAction(UIAlertAction(title: "Custom", style: .default, handler: nil))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func sendJS(str: String) {
       
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let arg: NSDictionary = ["customJavaScript": script.text]
        let webDict: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: arg]
        let customJS = NSItemProvider(item: webDict, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJS]
        
        extensionContext?.completeRequest(returningItems: [item])
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keybaordScreenEndFrame = keyboardValue.cgRectValue
        let keybaordViewEndFrame = view.convert(keybaordScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            script.contentInset = .zero
        } else {
            script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keybaordScreenEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        script.scrollIndicatorInsets = script.contentInset
        
        let selectedRange = script.selectedRange
        script.scrollRangeToVisible(selectedRange)
    }

}
