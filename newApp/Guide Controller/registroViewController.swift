//
//  registroViewController.swift
//  newApp
//
//  Created by MagdielG on 11/22/19.
//  Copyright © 2019 Magdiel Gómez. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class registroViewController: UIViewController {
    
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var apellidoTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    @IBOutlet weak var mensajeLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        

        sendButton.layer.cornerRadius = 7
        sendButton.clipsToBounds = true
        
        mensajeLabel.isHidden = true
        errorLabel.isHidden = true
    }
    
    @IBAction func enviarButton(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail:emailTextField.text!, password: passwordTextField.text!, completion: {(result, err) in
            
            if err != nil {
                self.errorLabel.isHidden = false
                self.mensajeLabel.isHidden = true
                
            }else{
                self.mensajeLabel.isHidden = false
                self.errorLabel.isHidden = true
                
                let db = Firestore.firestore()
                db.collection("usuarios").addDocument(data: ["nombre":self.nombreTextField.text!,"apellido":self.apellidoTextField.text!, "uid":result!.user.uid]){(error) in
                    
                    if error != nil {
                        self.errorLabel.isHidden = false
                        self.mensajeLabel.isHidden = true
                    }else{
                        self.nombreTextField.text! = ""
                        self.apellidoTextField.text! = ""
                        self.emailTextField.text! = ""
                        self.passwordTextField.text! = ""
                    }
                    
                }
                if #available(iOS 13.0, *) {
                    self.transitionToHome()
                } else {
                    // Fallback on earlier versions
                }
            }
            
        } )
        
    }
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    private func configureTextFields(){
        nombreTextField.delegate = self
        apellidoTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @available(iOS 13.0, *)
    func transitionToHome(){
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier:Constants.Storyboard.homeViewController) as?
        homeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
    

}

extension registroViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
