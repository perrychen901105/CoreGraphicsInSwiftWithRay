//
//  ViewController.swift
//  Flo
//
//  Created by chenzhipeng on 15/2/12.
//  Copyright (c) 2015年 chenzhipeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func btnPushButton(sender: PushButtonView) {
        if sender.isAddButton {
            counterView.counter++
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

