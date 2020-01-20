//
//  ViewController.swift
//  newApp
//
//  Created by MagdielG on 11/15/19.
//  Copyright © 2019 Magdiel Gómez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var inisiarSesionButton: UIButton!
    
    @IBOutlet weak var inisiarConFacebook: UIButton!
    
    @IBOutlet weak var crearCuentaButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    private let facebookColor = UIColor (red: 11/255, green: 62/255, blue: 128/255, alpha: 1)
    
    private let colorTextField = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 999)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondo.png")!)
        configureTextField()
        configureTapGesture()
       
        
        crearCuentaButton.layer.cornerRadius = 7
        crearCuentaButton.clipsToBounds = true
        
        inisiarSesionButton.layer.cornerRadius = 7
        inisiarSesionButton.clipsToBounds = true
        
        
        inisiarConFacebook.backgroundColor = facebookColor
        inisiarConFacebook.layer.cornerRadius = 7
        inisiarConFacebook.clipsToBounds = true
        errorLabel.isHidden = true
        
        
    }
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    private func configureTextField(){
        userTextField.delegate = self
        passwordTextfield.delegate = self
        
    }
    
    @available(iOS 13.0, *)
    @IBAction func inisiarSesionButton(_ sender: UIButton) {
        
        let email = userTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextfield.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            
            if error != nil{
                self.errorLabel.isHidden = false
                
            }else{
                let homeViewController = self.storyboard?.instantiateViewController(identifier:Constants.Storyboard.homeViewController) as?
                homeViewController
                
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
            
        }
        
        
        
        
    }
    
    
    
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
