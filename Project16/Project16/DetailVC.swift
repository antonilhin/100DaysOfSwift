//
//  DetailVC.swift
//  Project16
//
//  Created by Antoni on 11/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    var webKit: WKWebView!
    var wikiUrl: String!
    var placeName: String!
    
    override func loadView() {
        webKit = WKWebView()
        view = webKit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webKit.load(URLRequest(url: URL(string: wikiUrl)!))
        title = placeName

    }
    
    
    


}
