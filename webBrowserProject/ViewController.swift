//
//  ViewController.swift
//  webBrowserProject
//
//  Created by Ramin Akhmad on 21.05.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit
import WebKit

var myNotes: [URL] = []

protocol viewControllerDelegate {
    func pressedCell(url: String)
}

class ViewController: UIViewController, WKUIDelegate, viewControllerDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchAction(_ sender: Any) {
        textFieldShouldReturn(searchTextField)
        
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
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let curUrl = webView.url {
            myNotes.append(curUrl)
            UserSettings.shared.urlArray.append(curUrl.absoluteString)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myNotes = UserSettings.shared.urlArray.compactMap { URL(string: $0) }
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueNotes" else { return }
        guard let destination = segue.destination as? TableViewController else { return }
        destination.delegate = self
        
    }
    
    //MARK: - Func for searching
    func textFieldShouldReturn(_ textField: UITextField) {
        
        guard let urlString = textField.text else { return }
        
        if urlString.starts(with: "http://") || urlString.starts(with: "https://") {
            loadUrl(urlString)
        } else if urlString.contains("www") {
            loadUrl("http://\(urlString)")
        } else {
            searchTextOnGoogle(urlString)
        }
        textField.resignFirstResponder()
    }
    
    func loadUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func searchTextOnGoogle(_ text: String) {
        // check if text contains more then one word separated by space
        let textComponents = text.components(separatedBy: " ")
        
        // we replace space with plus to validate the string for the search url
        let searchString = textComponents.joined(separator: "+")
        
        guard let url = URL(string: "https://www.google.com/search?q=" + searchString) else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func pressedCell(url: String) {
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
}

