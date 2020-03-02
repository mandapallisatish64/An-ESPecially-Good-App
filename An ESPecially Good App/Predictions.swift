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

/// This structs describes the question infromation
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

/// This class contains methods for prediciton
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
    var currentQuestion:Question!
    
    /// Generates the random question
    func generateQuestion() {
        currentQuestion = Question()
        
        // questions.append(currentQuestion)
        currentQuestion.predictedShape = nil
        var temp = Int.random(in: 0...3)
        if temp == 0 {
            
            currentQuestion.actualShape = Shape.circle
            // print("first entered \(currentQuestion.actualShape)")
            
        }
        else if temp == 1 {
            currentQuestion.actualShape = Shape.triangle
            // print("first entered \(currentQuestion.actualShape)")
        }
        else {
            currentQuestion.actualShape = Shape.star
            // print("first entered \(currentQuestion.actualShape)")
        }
    }
    
    /// Checks whether question and predicted output is correct or not
    /// - Parameter prediction: predicted shape
    func check(prediction:Shape) -> Bool?{
        currentQuestion.predictedShape = prediction
        
        questions.append(currentQuestion)
        return currentQuestion.isCorrect
        
    }
    
    /// Number of attempts user made
    func numAttempted() -> Int{
        return questions.count
    }
    
    /// Number of correct answers
    func numCorrect() -> Int{
        var x = 0
        for i in questions {
            if i.isCorrect! {
                x = x + 1
            }
        }
        return x
    }
    
    /// It clears the results of an array
    func clearResults(){
        questions.removeAll()
    }
    
    /// Returns question at particular index
    /// - Parameter at: index value
    func question(at:Int) -> Question! {
        if at == -1 {
            return nil
        }
        return questions[at]
    }
    
    
}


