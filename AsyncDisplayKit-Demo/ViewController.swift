//
//  ViewController.swift
//  AsyncDisplayKit-Demo
//
//  Created by Yang, Tyler on 9/26/16.
//  Copyright © 2016 Cincas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pageViewModel: PageViewModel = PageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton()
        button.setTitle("Pop", forState: .Normal)
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
        button.addTarget(self, action: #selector(ViewController.display), forControlEvents: .TouchUpInside)
        automaticallyAdjustsScrollViewInsets = false
        edgesForExtendedLayout = .None
        extendedLayoutIncludesOpaqueBars = false
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func display() {
        let navigationController = UINavigationController(rootViewController: DemoPageViewController(nibName: nil, bundle: nil))
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
