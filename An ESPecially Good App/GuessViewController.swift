//
//  FirstViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    @IBOutlet weak var resultLBL:UILabel!
    @IBOutlet weak var scoreLBL:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tappedCircle(sender:Any){
        var e = Predictions.shared.check(prediction: .circle)
        
        var timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) {
            (_) in
            self.resultLBL.text = e == true ? "😀" : "😱"
        }
        var timer1 = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            (_) in
            self.resultLBL.text = "?"
        }
        
        
        
        //self.resultLBL.text = "?"
        self.scoreLBL.text = "\(Predictions.shared.numCorrect()) / \(Predictions.shared.numAttempted())"
        Predictions.shared.generateQuestion()
    }
    @IBAction func tappedTriangle(sender:Any){
        var e = Predictions.shared.check(prediction: .triangle)
        // print("predicted \(e)")
        //if e == true {
        // print("entred triangle")
        var timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) {
            (_) in
            self.resultLBL.text = e == true ? "😀" : "😱"
        }
        var timer1 = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            (_) in
            self.resultLBL.text = "?"
        }
        
        
        //  self.resultLBL.text = "?"
        self.scoreLBL.text = "\(Predictions.shared.numCorrect()) / \(Predictions.shared.numAttempted())"
        Predictions.shared.generateQuestion()
    }
    @IBAction func tappedStar(sender:Any){
        var e = Predictions.shared.check(prediction: .star)
        // print("predicted \(e)")
        var timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) {
            (_) in
            self.resultLBL.text = e == true ? "😀" : "😱"
        }
        var timer1 = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            (_) in
            self.resultLBL.text = "?"
        }
        
        self.scoreLBL.text = "\(Predictions.shared.numCorrect()) / \(Predictions.shared.numAttempted())"
        Predictions.shared.generateQuestion()
    }
    
    
}

