//
//  ViewController.swift
//  EggTimer
//
// Created by Shakhaidar Miras
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelText: UILabel!
    let eggTime: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var countDown = 60
    var fullTime = 1
    var timer = Timer()
    var progress: Float = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        countDown = eggTime[hardness]!
        fullTime = eggTime[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if countDown > 0 {
            progress = Float(countDown) / Float(fullTime)
            progressBar.progress = 1.0 - progress
            let minutes = String(countDown / 60)
            let seconds = String(countDown % 60)
            if (countDown % 60) > 9{
                labelText.text = minutes + ":" + seconds}
            else{
                labelText.text = minutes + ":" + "0" + seconds
            }
            //            print("\(countDown) seconds.")
            countDown -= 1
        }
        else{
            timer.invalidate()
            labelText.text = "Done!"
            progressBar.progress = 1.0
        }
    }
}
