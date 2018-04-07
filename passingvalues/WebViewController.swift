//
//  WebViewController.swift
//  passingvalues
//
//  Created by Kevin Scardina on 4/7/18.
//  Copyright © 2018 popmedic. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var urlToLoad:URL?
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = self.urlToLoad {
            self.webView.loadRequest(URLRequest(url: url))
        }
    }

    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        showError("Unable to load, \(error)")
    }
}
