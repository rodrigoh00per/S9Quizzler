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
    var score:Int = 0 ;
    var  lengtharray = 0;

    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion();
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
        
        nextQuestion();
        
    }
    
    
    func updateUI() {
          scoreLabel.text = "Score: \(score)";
        progressLabel.text = "\(questionNumber + 1)/\(13)";
        progressBar.frame.size.width = (view.frame.size.width / 13) *  CGFloat(questionNumber + 1);
    }
    

    func nextQuestion() {
        if(questionNumber < allQuestions.list.count){
         questionLabel.text = allQuestions.list[questionNumber].questionText;
            updateUI();
        }
        
        else{
            //CREATE A SIMPLE ALERT
            let alert = UIAlertController(title: "Awesome", message: "Do you want to restart the game?", preferredStyle: .alert);
            
            //ACTION FOR THE ALERT
            let restartAction = UIAlertAction(title: "Restart",style:.default,handler: { (UIAlertAction) in
                self.startOver();
            });
        
            //PUT THE RESET ACTION INTO THE ALERT
            alert.addAction(restartAction);
            
            
            //SHOW THE ALERT TO THE USER.
            present(alert,animated: true,completion: nil);
        }
        
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer;
        
        if(correctAnswer == pickedAnswer){
            score += 1;
            ProgressHUD.showSuccess("Correct");
        }
        else{
            ProgressHUD.showError("Wrong");
        }
    }
    
    
    func startOver() {
        questionNumber = 0;
        score = 0 ;
        nextQuestion();
 
    }
    

    
}
