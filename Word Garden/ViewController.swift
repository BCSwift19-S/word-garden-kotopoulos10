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
    
    //Global Vars
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    var wrongNumberOfGuessesRemaining = 8
    var guessCount = 0
    
    //Global Constants
    let maxNumberOfWrongGuesses = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        for letter in wordToGuess{
            if (lettersGuessed.contains(letter)){
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter (){
        formatUserGuessLabel()
        guessCount += 1
        //Decrements the wrong letter guessed
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongNumberOfGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower" + "\(wrongNumberOfGuessesRemaining)")
        }
        
        let revealedWorld = userGuessLabel.text!
        //Stop game is wrongGessedRemaining == 0
        if wrongNumberOfGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry you're all out of guesses. Try Again?"
        } else if !revealedWorld.contains("_"){
            //you won
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You got it! It took you \(guessCount) guesses!"
        } else{
            //update guess count
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)."
        }
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
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        
        flowerImageView.image = UIImage(named: "flower8")
        wrongNumberOfGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses."
        guessCount = 0
    }
}

