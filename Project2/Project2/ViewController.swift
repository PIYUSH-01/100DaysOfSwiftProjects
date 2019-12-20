//
//  ViewController.swift
//  Project2
//
//  Created by PIYUSH KHURANA on 20/12/19.
//  Copyright © 2019 PIYUSH KHURANA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]() //Array to hold the image names
    var score = 0
    var correctAnswer = 0
    var limit = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Uploading data to our array which contains all the images.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        //By adding the nil value after forcelyunwrapping the optionalthis means that if no parameters are pased then use nil as default. and the example of this type of caaling of thisfunction is right above in viewdidLoad()
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        //Seting initial images to our buttons
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " \(score)"

        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        limit += 1
        var title: String
        
        if limit<10 {
            if sender.tag == correctAnswer{
                    title = "CORRECT"
                    score += 1
                }else{
                    title = "WRONG\nIt is \(countries[sender.tag].uppercased())"
                    score -= 1
                }
                
                let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
        }else{
            title = "You've answered 10 questions"
            if sender.tag == correctAnswer{
            score += 1
            }else{
                score -= 1
            }
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .cancel, handler: askQuestion))
            present(ac, animated: true)
            score = 0
        }
    }
}


