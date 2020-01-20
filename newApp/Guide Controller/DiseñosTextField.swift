//
//  DiseñosTextField.swift
//  newApp
//
//  Created by MagdielG on 11/26/19.
//  Copyright © 2019 Magdiel Gómez. All rights reserved.
//

import UIKit


@IBDesignable
class Disen_osTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var leftImage: UIImage? {
        didSet{
             updateView()
        }
    }
    
    @IBInspectable var leftPaddin: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    
    func updateView(){
        if let image = leftImage{
            leftViewMode = .always
            
            
            let imageView = UIImageView(frame:  CGRect(x: leftPaddin, y: -5, width: 30, height: 30))
            imageView.image = image
            imageView.tintColor = tintColor
            
            var width = leftPaddin + 20
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width = width + 5
            }
            
            
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
            view.addSubview(imageView)
            
            leftView = view
            
        }else{
            leftViewMode = .never
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor:tintColor as Any])
        
    }

}
