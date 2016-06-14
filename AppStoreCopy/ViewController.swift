//
//  ViewController.swift
//  AppStoreCopy
//
//  Created by 敷地琢也 on 2016/06/13.
//  Copyright © 2016年 takuya shikichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepare")
    }
    
    //MARK: - IBAction
    @IBAction func unwindToTopViewController(segue:UIStoryboardSegue) {
    
    }
    

}

