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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var graphView: GraphView!
    
    var isGraphViewShowing = false
    
    @IBAction func counterViewTap(gesture: UITapGestureRecognizer?) {
        if isGraphViewShowing {
            // hide graph
            UIView.transitionFromView(graphView,
                toView: counterView,
                duration: 1.0,
                options: .TransitionFlipFromLeft | .ShowHideTransitionViews,
                completion: nil)
        } else {
            // Show Graph
            UIView.transitionFromView(counterView,
                toView: graphView,
                duration: 1.0,
                options: .TransitionFlipFromRight | .ShowHideTransitionViews,
                completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    
    @IBAction func btnPushButton(sender: PushButtonView) {
        if sender.isAddButton {
            counterView.counter++
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
        }
        counterLabel.text = String(counterView.counter)
        if isGraphViewShowing {
            counterViewTap(nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

