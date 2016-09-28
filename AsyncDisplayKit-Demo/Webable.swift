//
//  Webable.swift
//  AsyncDisplayKit-Demo
//
//  Created by Tyler Yang on 2016/9/28.
//  Copyright © 2016年 Cincas. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol Webable {
    func presentURL(url: NSURL, isPush push: Bool, animated: Bool, completion: (() -> Void)?)
    func presentHTMLString(htmlString: String, isPush push: Bool, animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: Webable {
    func presentURL(url: NSURL, isPush push: Bool, animated: Bool, completion: (() -> Void)?) {
        guard let viewController = webViewControllerType(forURL: url).init(URL: url) as? UIViewController else { return }
        if push && self.navigationController != nil {
            self.navigationController?.pushViewController(viewController, animated: animated)
            completion?()
        } else {
            self.presentViewController(viewController, animated: animated, completion: completion)
        }
    }
    
    func presentHTMLString(htmlString: String, isPush push: Bool, animated: Bool, completion: (() -> Void)?) {
        // TODO
    }

    func webViewControllerType(forURL URL: NSURL) -> WebViewControllerType.Type {
        if URL.isWebURL {
            return SFSafariViewController.self
        } else {
            return WebViewController.self
        }
    }
}

extension NSURL {
    var isFilePath: Bool {
        return false
    }
    
    var containsProtocol: Bool {
        return true
    }
    
    var isWebURL: Bool {
        return true
    }
}
