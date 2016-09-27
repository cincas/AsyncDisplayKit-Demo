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

class DemoViewController: ASViewController {
    var tableNode: ASTableNode = ASTableNode(style: .Plain)
    
    required init() {
        super.init(node: tableNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableNode.view.relayoutItems()
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
