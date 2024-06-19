//
//  CWButton.swift
//  CardWorkout - Programmatic
//
//  Created by Robert Schroeder on 2/29/24.
//

import UIKit

class CWButton: UIButton {

    // Default initializer that returns empty button. Can be called without arguments, even though
    // it states that it requires a "frame" argument. 
    
    override init(frame: CGRect) {
        super.init(frame : frame) // a frame is equivalent to Storyboard constraints.
        configure()
        
    }
    
    init(backgroundColor : UIColor , title : String){
        
        //sets the frames to zero, as well be setting contraints on the button

        super.init(frame : .zero) // We set this to zero because we'll use contraints instead of frames.
        
        self.backgroundColor = backgroundColor
        setTitle(title, for: UIControl.State.normal)
        configure()
        
    }
    
    // Note: the method below is required for every subclass we programatically implement.
    // Its intended to initialize our object via Storyboard, even if we don't have the latter.
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configures the UIButton instances with some default values
    
    func configure(){
        
        layer.cornerRadius = 9
        
        // Note that knowing what to use for these properties is not easy to tell, and is best just to
        // look up online.
        
        titleLabel?.font = .systemFont(ofSize : 19 , weight : UIFont.Weight.bold)
        setTitleColor(UIColor.white, for: UIControl.State.normal)
        translatesAutoresizingMaskIntoConstraints = false // This is essentially referencing Auto-layout.
        
    }

}
