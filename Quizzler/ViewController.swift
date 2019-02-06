//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBlank();
    var pickedAnswer:Bool =  false;
    var questionNumber = 0;
    var  lengtharray = 0;

    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstAnswer = allQuestions.list[0];
        questionLabel.text  = firstAnswer.questionText;
         lengtharray = allQuestions.list.count;
    }


    @IBAction func answerPressed(_ sender: AnyObject) {

        
      
        
        if (sender.tag == 1 ){
            pickedAnswer = true;
        }
            
        else if(sender.tag == 2 ){
            pickedAnswer = false;
        }
        checkAnswer();
        
        questionNumber = questionNumber + 1;
   
        if(questionNumber>allQuestions.list.count - 1 ){
            questionNumber = 0;
        }
        
        
        questionLabel.text = allQuestions.list[questionNumber].questionText;
        
       
       
        
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer;
        if(correctAnswer == pickedAnswer){
            print("Tu respuesta es correcta");
        }
        else{
            print("Tu respuesta es incorrecta");
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
