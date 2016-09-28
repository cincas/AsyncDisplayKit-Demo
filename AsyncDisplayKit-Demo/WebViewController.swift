//
//  WebViewController.swift
//  AsyncDisplayKit-Demo
//
//  Created by Tyler Yang on 2016/9/28.
//  Copyright © 2016年 Cincas. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import SafariServices

protocol WebViewControllerType {
    init(URL: NSURL)
}

class WebViewController: UIViewController, WebViewControllerType {
    var webView: WKWebView
    
    convenience init() {
        self.init(configuration: nil)
    }
    
    required convenience init(URL: NSURL) {
        self.init(configuration: nil)
        self.loadURL(URL)
    }
    
    init(configuration: WKWebViewConfiguration?) {
        if let configuration = configuration {
            webView = WKWebView(frame: CGRectZero, configuration: configuration)
        } else {
            webView = WKWebView(frame: CGRectZero)
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadURL(URL: NSURL) {
        webView.loadRequest(NSURLRequest(URL: URL))
    }
    
    func loadHTMLString(htmlString: String, baseURL: NSURL?) {
        webView.loadHTMLString(htmlString, baseURL: baseURL)
    }
}

extension SFSafariViewController: WebViewControllerType {
    
}
