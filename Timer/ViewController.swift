//
//  ViewController.swift
//  Timer
//
//  Created by Krish Furia on 12/22/15.
//  Copyright © 2015 Krish Furia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer  = NSTimer()
    
    var hour = 0
    var min = 0
    var sec = 0
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var playButtonOutlet: UIBarButtonItem!
    
    @IBAction func playButton(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
        playButtonOutlet.enabled = false
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        sec = 0;
        min = 0;
        hour = 0;
        timerLabel.text = "00:00:00"
        playButtonOutlet.enabled = true
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate();
        playButtonOutlet.enabled = true
    }
    

    func increaseTimer() {
        sec++
        if sec > 59 {
            if min < 59 {
                min++
                sec = 0
            }
            else {
                hour++
                min = 0
                sec = 0
            }
        }
        timerLabel.text = String(format: "%02d", hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

