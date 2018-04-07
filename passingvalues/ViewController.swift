//
//  ViewController.swift
//  passingvalues
//
//  Created by Kevin Scardina on 4/7/18.
//  Copyright © 2018 popmedic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var urlTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webViewController = segue.destination as? WebViewController {
            if let url = sender as? URL {
                webViewController.urlToLoad = url
            }
        }
    }
    
    @IBAction func gotoURLButtonAction(_ sender: Any) {
        let url = self.urlTextView.text ?? ""
        if url.count > 0 {
            if isProperHTTPUrl(str: url) {
                self.performSegue(withIdentifier: "ViewControllerToWebViewController", sender: URL(string: url))
            } else {
                showError("not proper url format")
            }
        } else {
            showError("must set url")
        }
    }
    
    func isProperHTTPUrl(str:String) -> Bool {
        let re = try! NSRegularExpression(pattern: "(?i)https?:\\/.*", options: [])
        return re.numberOfMatches(in: str, options: .anchored, range: NSRange(location: 0, length: str.count)) > 0
    }
}
extension UIViewController {
    func showError(_ msg:String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "ERROR", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}

