//
//  DeViewController.swift
//  susu
//
//  Created by chentianyu on 15/8/2.
//  Copyright (c) 2015年 chentianyu. All rights reserved.
//

import UIKit

class DeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var fakeData:NSMutableArray?
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        fakeData = NSMutableArray()
        for (var i:Int = 0; i<15; i++) {
            var text:String = "内容"+String( arc4random_uniform(10000))
            self.fakeData!.addObject(text)
        }
        
        self.myTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "TableViewCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
         self.setupRefresh()
    }
    override func viewWillAppear(animated: Bool) {
//        self.setupRefresh()
    }

    func setupRefresh(){
        
        self.myTableView.addHeaderWithCallback({
            self.fakeData!.removeAllObjects()
            for (var i:Int = 0; i<15; i++) {
                var text:String = "内容"+String( arc4random_uniform(10000))
                self.fakeData!.addObject(text)
            }
            
            
            let delayInSeconds:Int64 =  1000000000  * 2
            
            
            var popTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW,delayInSeconds)
            dispatch_after(popTime, dispatch_get_main_queue(), {
                self.myTableView.reloadData()
                self.myTableView.headerEndRefreshing()
            })
            
        })
        
        
        self.myTableView.addFooterWithCallback({
            for (var i:Int = 0; i<10; i++) {
                var text:String = "内容"+String( arc4random_uniform(10000))
                
                self.fakeData!.addObject(text)
            }
            let delayInSeconds:Int64 = 1000000000 * 2
            var popTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW,delayInSeconds)
            dispatch_after(popTime, dispatch_get_main_queue(), {
                self.myTableView.reloadData()
                self.myTableView.footerEndRefreshing()
                
                //self.tableView.setFooterHidden(true)
            })
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.fakeData!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil { // no value
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell") as UITableViewCell
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            var statusLabel = UILabel()
            statusLabel.frame = CGRectMake(0, 0, 320, 36)
            statusLabel.font = UIFont.boldSystemFontOfSize(13)
            statusLabel.textColor = UIColor.blackColor()
            statusLabel.backgroundColor = UIColor.clearColor()
            statusLabel.textAlignment = NSTextAlignment.Center
            cell!.contentView.addSubview(statusLabel)
            statusLabel.tag = 1000001
        }
        var statusLabel:UILabel = cell!.contentView.viewWithTag(1000001) as!  UILabel
        statusLabel.text = fakeData!.objectAtIndex(indexPath.row) as! String
        
        return cell!
    }
}
