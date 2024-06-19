//
//  CardSelectionVC.swift
//  CardWorkout - Programmatic
//
//  Created by Robert Schroeder on 2/28/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView() // We instantiate an empty image view
    let startButton = CWButton(backgroundColor: UIColor.systemGreen, title: "Start!") // constructor for our button subclass
    let rulesButton = CWButton(backgroundColor: UIColor.systemBlue, title: "Rules")
    
    let deck = Deck.allItems
    
    var timer : Timer! // creates an instance of Timer that we'll later instanciate with a constructor.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if timer != nil {
                timer.invalidate()
            
            }   
        
        
    }
    
    func startTimer(){
        
        // This instantiates Timer with the constructor below.
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(selectRandomCard), userInfo: nil, repeats: true)
        
    }
    
    func stopTimer(){
        
        // Method below stops the timer.
        
        timer.invalidate()
    }
    
    @objc func selectRandomCard(){
        
        cardImageView.image = deck.randomElement()
    }
    
    // Configures the overall layout of the objects in the view controller
    
    func configureUI(){
        
        view.addSubview(cardImageView)
        view.addSubview(startButton)
        view.addSubview(rulesButton)
        
        
        configureCardImageView()
        configureStartButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "2C")
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centered horizontally relative to the view controllers' view
            
            //Centered vertically relative to the view controllers' view, and 100 points from the top
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -100)
            
            
            
        ])
        
    }
    
    func configureStartButton(){
        
        startButton.addTarget(self, action: #selector(changeState), for: UIControl.Event.touchUpInside)
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor , constant: 40) // sets the top anchor relative to the bottom anchor of the UIImageView
            
        ])
        
        
    }
    
    func configureRulesButton(){
        
        // Here we create an action that presents the RulesVC modally on the screen.
        // it creates an event listener that triggers the given function when the event is triggered.
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: UIControl.Event.touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.centerXAnchor.constraint(equalTo: startButton.centerXAnchor),
            rulesButton.topAnchor.constraint(equalTo: startButton.bottomAnchor , constant: 25) // sets the top anchor relative to the bottom anchor of the UIImageView
            
        ])
        
        
    }
    
    
    
    @objc func presentRulesVC(){
        
        present(RulesVC(), animated: true)
        
    }
    
    
    
    @objc func changeState(){
        
        // here we need to change the font and font background based on whether the text says "Start!"
        if startButton.titleLabel?.text == "Start!"{
            
            //UIControl.State.normal = the default state the button is in when no other state is applied to it
            // ie it's not being highlighted, selected, etc.
            startButton.setTitle("Stop", for: UIControl.State.normal)
            startButton.backgroundColor = UIColor.systemRed
            startTimer()
        }
        else if startButton.titleLabel?.text == "Stop"{
            startButton.setTitle("Start!", for: UIControl.State.normal)
            startButton.backgroundColor = UIColor.systemGreen
            stopTimer()
        }
        
    }
    
  
}


