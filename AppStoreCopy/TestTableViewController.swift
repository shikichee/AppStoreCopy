//
//  TestTableViewController.swift
//  AppStoreCopy
//
//  Created by 敷地琢也 on 2016/06/13.
//  Copyright © 2016年 takuya shikichi. All rights reserved.
//

import UIKit
import SwiftyJSON

class TestTableViewController: UIViewController {
    var applications = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "https://itunes.apple.com/jp/rss/topfreeapplications/limit=30/json"
        
        if let url = NSURL(string: urlString) {
            if let data = try? NSData(contentsOfURL: url, options: []) {
                let json = JSON(data: data)
                parseJson(json)
                
            }
        }
    }
    
    func parseJson(json: JSON) {
        for application in json["feed"]["entry"].arrayValue {
            let title = application["im:name"]["label"].stringValue
            let category = application["category"]["attributes"]["label"].stringValue
            let images = application["im:image"].arrayValue
            var imageUrl = ""
            
            for image in images {
                if image["attributes"]["height"] == "100" {
                    imageUrl = image["label"].stringValue
                    break
                }
            }
        
            applications.append(["title":title, "category":category, "imageUrl":imageUrl])
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TestTableViewController: UITableViewDelegate {
    
}

    
extension TestTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.applications.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        cell.customLabel.text = self.applications[indexPath.row]["title"]
        
        let url = NSURL(string: self.applications[indexPath.row]["imageUrl"]!)
        
        print(self.applications[indexPath.row]["imageUrl"]!)
        let req = NSURLRequest(URL:url!)

        NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
 
            let image = UIImage(data:data!)
            cell.customImageView.image = image
        }
        
        return cell
    }
}