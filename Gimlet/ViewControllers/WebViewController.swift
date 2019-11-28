//
//  WebViewController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-28.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    
    var urlForWebRequest: String?
    var authorOfPosts: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeb()
        webView.allowsBackForwardNavigationGestures = true
       
    }

    func constraintsWeb() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    
    func loadWeb() {
        if let url = urlForWebRequest {
            let request = URLRequest(url: URL(string: url)!)
            webView.load(request)
        }
    }

}
