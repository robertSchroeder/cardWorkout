//
//  RulesVC.swift
//  CardWorkout - Programmatic
//
//  Created by Robert Schroeder on 3/1/24.
//

import UIKit

let titleLabel = UILabel()
let descriptionLabel = UILabel()
let suitLabel = UILabel()

class RulesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        configureUI()
        
    }
    
    func configureUI(){
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(suitLabel)
        
        configureTitleLabel()
        configureDescriptionLabel()
        configureSuitLabel()
    }
    

    func configureTitleLabel(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.textAlignment = NSTextAlignment.center // Remember to use this if we're tying to center the label.
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 137), // .safeAreaLayoutGuide is how we do our x- constraint based on safe area
            titleLabel.leadingAnchor.constraint(equalTo : view.leadingAnchor, constant: 30), // .leadingAnchor and .trailingAnchor id how we assign the margin values
            titleLabel.trailingAnchor.constraint(equalTo : view.trailingAnchor, constant: -30) // trailing anchor value needs to be negative for some reason.
        ])
        
    }
    
    func configureDescriptionLabel(){
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = NSTextAlignment.center
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 0 // Sets the number of lines to be automatic; very importart; content won't wrap without it.
        descriptionLabel.text = "The value of each card represents the number of exercises that you will perform \n\n J = 11, Q = 12, K = 13, A = 14 "
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20), // .safeAreaLayoutGuide is how we do our x- constraint based on safe area
            descriptionLabel.leadingAnchor.constraint(equalTo : view.leadingAnchor, constant: 30), // .leadingAnchor and .trailingAnchor id how we assign the margin values
            descriptionLabel.trailingAnchor.constraint(equalTo : view.trailingAnchor, constant: -30) // trailing anchor value needs to be negative for some reason.
        ])
        
        
        
    }
    
    func configureSuitLabel(){
        
        suitLabel.translatesAutoresizingMaskIntoConstraints = false
        suitLabel.textAlignment = NSTextAlignment.natural
        suitLabel.numberOfLines = 0
        suitLabel.font = UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.semibold)
        suitLabel.text = "♠️ = Push-up\n❤️ = Sit-up\n♣️ = Burpees\n♦️ = Jumping-Jacks"
        
        NSLayoutConstraint.activate([
            suitLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            suitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            suitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ]
        )
        
        
        
        
    }
    

}
