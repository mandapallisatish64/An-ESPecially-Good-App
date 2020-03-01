//
//  Predictions.swift
//  An ESPecially Good App
//
//  Created by student on 2/29/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation
enum Shape {
    case circle,triangle,star
}
struct Question{
    var actualShape:Shape!
    var predictedShape:Shape!
    var isCorrect:Bool? {
        if actualShape == predictedShape {
            return true
        }
        else if actualShape == nil || predictedShape == nil {
            return nil
        }
        else {
            return false
        }
    }
}
class Predictions{
    private static var _shared:Predictions! // Only visible in this struct
    private init() {
        generateQuestion()
    }
    static var shared:Predictions {         // To access this anywhere, in the app just write Restaurants.shared
        if _shared == nil {
            _shared = Predictions()
        }
        return _shared
    }
    var questions:[Question] = []
    var currentQuestion:Question! = Question()
    
    func generateQuestion() {
       // currentQuestion = Question()
        
       // questions.append(currentQuestion)
        currentQuestion.predictedShape = nil
        var temp = Int.random(in: 0...3)
        if temp == 0 {
            
            currentQuestion.actualShape = Shape.circle
            
        }
        else if temp == 1 {
            currentQuestion.actualShape = Shape.triangle
        }
        else {
            currentQuestion.actualShape = Shape.star
        }
    }
    
    func check(prediction:Shape) -> Bool?{
        currentQuestion.predictedShape = prediction
        questions.append(currentQuestion)
        return currentQuestion.isCorrect
        
    }
    func numAttempted() -> Int{
        return questions.count
    }
    func numCorrect() -> Int{
        return questions.count
    }
    func clearResults(){
        questions.removeAll()
    }
    func question(at:Int) -> Question! {
        if at == -1 {
            return nil
        }
        return questions[at]
    }
    
    
}


