//
//  SelectionButton.swift
//  PrototypeViews
//
//  Created by Jean-Marc Boullianne on 8/18/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import UIKit

@IBDesignable class SelectionButton: UIButton {

    // Allows developer to edit what colors are shown in each state
    @IBInspectable var borderColorSelected:UIColor = UIColor.purple
    @IBInspectable var borderColorDeselected:UIColor = UIColor.purple

    @IBInspectable var backgroundColorSelected:UIColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
    @IBInspectable var backgroundColorDeselected:UIColor = UIColor.systemBlue

    
    @IBInspectable var borderWidth:CGFloat = 0
    @IBInspectable var cornerRadius:CGFloat = 10
    
    // The text that's shown in each state
    @IBInspectable var selectedText:String = "Selected"
    @IBInspectable var deselectedText:String = "Deselected"
    
    // The color of text shown in each state
    @IBInspectable var textColorDeselected:UIColor = UIColor.black
    @IBInspectable var textColorSelected:UIColor = UIColor.black
    
    // Sets the Active/Inactive State
    @IBInspectable var active:Bool = false
    
    // Custom Border to the UIButton
    let border = CAShapeLayer()
    var id : Int = -999
    
    override func draw(_ rect: CGRect) {
        titleLabel?.font = UIFont(name: "Circular Std Book", size: 12)
        
        // Setup CAShape Layer (Dashed/Solid Border)
        // Setup the Button Depending on What State it is in
        if active {
            setSelected()
        } else { 
            setDeselected()
        }
        
        // Respond to touch events by user
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    func setID(id: Int){
        self.id = id
    }
    
    @objc func onPress() {
        print("Button Pressed")
        active = !active
        
        if active {
            setSelected()
        } else {
            setDeselected()
        }
    }
    
    // Set the selected properties
    func setSelected() {
        border.lineDashPattern = nil
        border.strokeColor = borderColorSelected.cgColor
        self.setTitle(selectedText, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
        layer.masksToBounds = false
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        layer.borderColor = CGColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
        layer.borderWidth = 1
        backgroundColor = backgroundColorSelected
        tintColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
    }
    
    // Set the deselcted properties
    func setDeselected() {
        border.lineDashPattern = nil
        border.strokeColor = borderColorSelected.cgColor
        self.setTitleColor(textColorDeselected, for: .normal)
        layer.masksToBounds = false
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        layer.borderColor = CGColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
//        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        backgroundColor = backgroundColorDeselected == UIColor.systemBlue ? .none : backgroundColorDeselected
        tintColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
    }

}

