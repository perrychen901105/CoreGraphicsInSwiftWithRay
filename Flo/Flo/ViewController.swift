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
    @IBOutlet weak var medalView: MedalView!
    //Label outlets
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
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
            setupGraphDisplay()
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
        checkTotal()
    }
    
    func checkTotal() {
        if counterView.counter >= 8 {
            medalView.showMedal(true)
        } else {
            medalView.showMedal(false)
        }
    }
    
    func setupGraphDisplay() {
        //Use 7 days for graph - can use any number,
        //but labels and sample data are set up for 7 days
        let noOfDays:Int = 7
        
        //1 - replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        
        //2 - indicate that the graph needs to be redrawn
        graphView.setNeedsDisplay()
        
        maxLabel.text = "\(maxElement(graphView.graphPoints))"
        
        //3 - calculate average from graphPoints
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        // set up labels
        // day of week labels are set up in storyboard with tags
        // today is last day of the array need to go backwards
        
        //4 - get today's day number
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let componentOptions:NSCalendarUnit = .WeekdayCalendarUnit
        let components = calendar.components(componentOptions, fromDate: NSDate())
        
        var weekday = components.weekday
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        //5 - set up the day name labels with correct day
        for i in reverse(1...days.count) {
            let labelView = graphView.viewWithTag(i) as UILabel
            if weekday == 7 {
                weekday = 0
            }
            labelView.text = days[weekday--]
            if weekday < 0 {
                weekday = days.count - 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        checkTotal()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

