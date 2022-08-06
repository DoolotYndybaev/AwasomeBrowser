//
//  ViewController.swift
//  AwasomeBrowser
//
//  Created by Doolot on 6/8/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        webView.navigationDelegate = self

        
        let homePage = "https://www.apple.com"

        let url = URL(string: homePage)
        let reguest = URLRequest(url: url!)
        
        webView.load(reguest)
        webView.allowsBackForwardNavigationGestures = true
        
        urlTextField.text = homePage
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
        @IBAction func forwardAction(_ sender: UIButton) {
            if webView.canGoForward{
                webView.goForward()
            }
    }
}

extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let reguest = URLRequest(url: url)
        
        webView.load(reguest)
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        urlTextField.text = webView.url?.absoluteString
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}
