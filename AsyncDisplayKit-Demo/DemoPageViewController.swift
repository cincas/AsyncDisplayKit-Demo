//
//  DemoPageViewController.swift
//  AsyncDisplayKit-Demo
//
//  Created by Yang, Tyler on 9/27/16.
//  Copyright © 2016 Cincas. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import AsyncDisplayKit

class DemoPageViewController: UIViewController {
    var pageViewModel: PageViewModel = PageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        edgesForExtendedLayout = .None
        extendedLayoutIncludesOpaqueBars = false
        navigationController?.hidesBarsOnSwipe = true
        
        let toolbar = UIToolbar()
        view.addSubview(toolbar)
        
        // Use page view controller cause the same problem
//        let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
//        pageViewController.dataSource = pageViewModel
//        pageViewController.automaticallyAdjustsScrollViewInsets = false
//        pageViewController.edgesForExtendedLayout = .None
//        pageViewController.extendedLayoutIncludesOpaqueBars = false
//        pageViewController.navigationController?.hidesBarsOnSwipe = true
//        
//        pageViewController.setViewControllers([DemoViewController(nibName: nil, bundle: nil)], direction: .Forward, animated: false, completion: nil)
//        
//        addChildViewController(pageViewController)
//        view.addSubview(pageViewController.view)
//        
//        pageViewController.view.snp_makeConstraints { (make) in
//            make.top.left.right.equalTo(view)
//            make.bottom.equalTo(toolbar.snp_top)
//        }
        
        // Use view controller directly cause same problem
        let viewController = DemoViewController()
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        
        viewController.view.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolbar.snp_top)
        }
        
        toolbar.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
        }
        
        let closeButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(DemoPageViewController.close))
        self.navigationItem.leftBarButtonItem = closeButtonItem
    }
    
    func close() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

class PageViewModel: NSObject, UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return DemoViewController()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return DemoViewController()
    }
}
