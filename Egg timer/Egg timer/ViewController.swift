//
//  ViewController.swift
//  Egg timer
//
//  Created by Asmina on 04/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var hardnessTimeLimit : [String : Float] = ["Soft": 300.0, "Medium": 420.0, "Hard": 720.0];
    
    var timer = Timer();
    
    var timeLimit : Float = 300.0;
    
    var counter : Float = 0.0;

    @IBAction func onHardnessSelect(_ sender: UIButton) {
        titleLabel.text = sender.currentTitle;
        timeLimit = hardnessTimeLimit[sender.currentTitle ?? "Soft"] ?? 300.0;
        timer.invalidate();
        counter = 0.0;
        progressView.progress = 0.0;
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil,  repeats: true);
    }
    
    @objc func timerAction() {
        counter += 1;
        let clampedValue = counter / timeLimit;
        progressView.progress = clampedValue;
        if(counter >= timeLimit) {
            timer.invalidate();
            titleLabel.text = "Done";
        }
        }
    
}

