//
//  WebViewController.swift
//  UniversityList API
//
//  Created by Celestial on 08/12/23.
//
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate
{
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var webViewModel:WebViewModel?
    var timer: Timer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Start loading the web page
        openLinks()
        
        // Start the timer to check for loading status
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(loading), userInfo: nil, repeats: true)
    }
    
    func openLinks()
    {
        if let urlString = webViewModel?.url,
           let url = URL(string: urlString)
        {
//            print(urlString)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @objc func loading()
    {
        if webView.isLoading
        {
            activityIndicator.startAnimating()
        }
        else
        {
            activityIndicator.stopAnimating()
        }
    }
}
