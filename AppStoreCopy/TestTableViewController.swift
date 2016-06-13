//
//  TestTableViewController.swift
//  AppStoreCopy
//
//  Created by 敷地琢也 on 2016/06/13.
//  Copyright © 2016年 takuya shikichi. All rights reserved.
//

import UIKit

class TestTableViewController: UIViewController {
    static let sampleData = ["1","2","3"]
}

extension TestTableViewController: UITableViewDelegate {
    
}

    
extension TestTableViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestTableViewController.sampleData.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        cell.customLabel.text = TestTableViewController.sampleData[indexPath.row]
        cell.customImageView.image = UIImage(named: TestTableViewController.sampleData[indexPath.row])
        
        return cell
    }
}