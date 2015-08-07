//
//  ViewController.swift
//  susu
//
//  Created by chentianyu on 15/8/1.
//  Copyright (c) 2015年 chentianyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        var button1:UIButton = UIButton(frame: CGRectMake(70, 200, 200, 50))
        button1.setTitle("手写TableView", forState: UIControlState.Normal)
        button1.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button1.addTarget(self, action: "handTableView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        var button2:UIButton = UIButton(frame: CGRectMake(70, 260, 200, 50))
        button2.setTitle("手写ScrollView", forState: UIControlState.Normal)
        button2.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button2.addTarget(self, action: "handScrollView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button2)
        
        
        var button3:UIButton = UIButton(frame: CGRectMake(70, 320, 200, 50))
        button3.setTitle("xib的tableView", forState: UIControlState.Normal)
        button3.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button3.addTarget(self, action: "XIBTableView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button3)
        
        var button4:UIButton = UIButton(frame: CGRectMake(70, 380, 200, 50))
        button4.setTitle("自定义的tableView", forState: UIControlState.Normal)
        button4.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button4.addTarget(self, action: "MyTableView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //手写TableView——对应TTableViewController
    func handTableView()
    {

        self.navigationController?.pushViewController(TTableViewController(), animated: true)
    }
    
    //手写TableView——对应TScrollViewController
    func handScrollView()
    {
        self.navigationController?.pushViewController(TScrollViewController(), animated: true)
    }
    
    //带XIB的TableView——对应TestTableViewController 
    //setupRefresh()写在ViewViewAppear()函数里
    func XIBTableView()
    {
        var test:TestTableViewController = TestTableViewController(nibName: "TestTableViewController", bundle: nil)
        self.navigationController?.pushViewController(test, animated: true)
    }
    
    ///自定义的tableView，对应DeViewController
    //setupRefresh()写在ViewDidAppear()函数里
    func MyTableView()
    {
        var de :DeViewController = DeViewController(nibName: "DeViewController", bundle: nil)
        self.navigationController?.pushViewController(de, animated: true)
        
    }
    


}

