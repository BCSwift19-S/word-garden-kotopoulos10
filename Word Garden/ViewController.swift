//
//  ViewController.swift
//  Word Garden
//
//  Created by Tom Kotopoulos on 1/30/19.
//  Copyright © 2019 Tom Kotopoulos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Labels
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    
    //TextFields
    @IBOutlet weak var guessedLetterField: UITextField!
    
    //Buttons
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //Image Views
    @IBOutlet weak var flowerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last{
            guessedLetterField.text = String(letterGuessed)
            guessLetterButton.isEnabled = true
        } else {
            //dissable the button is there is no character types
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
    }
}

