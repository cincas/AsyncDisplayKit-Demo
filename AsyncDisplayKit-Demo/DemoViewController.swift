//
//  DemoViewController.swift
//  AsyncDisplayKit-Demo
//
//  Created by Yang, Tyler on 9/26/16.
//  Copyright © 2016 Cincas. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import AsyncDisplayKit

class DemoViewController: UIViewController {
    var tableNode: ASTableNode = ASTableNode(style: .Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubnode(tableNode)
        navigationController?.hidesBarsOnSwipe = true
        title = "Demo View Controller"

        
        tableNode.view.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        tableNode.delegate = self
        tableNode.dataSource = self
    }
}

extension DemoViewController: ASTableDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func tableView(tableView: ASTableView, nodeForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
        let node = ASTextCellNode()
        node.text = "At index \(indexPath)"
        return node
    }
}

extension DemoViewController: ASTableDelegate {
}
