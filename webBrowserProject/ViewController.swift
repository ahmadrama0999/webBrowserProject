//
//  ViewController.swift
//  webBrowserProject
//
//  Created by Ramin Akhmad on 21.05.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchAction(_ sender: Any) {
        guard let url = searchTextField.text else { return }
        let request = URLRequest( url: URL(string: url)!)
        webView.load(request)
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

