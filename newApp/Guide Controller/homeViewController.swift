//
//  homeViewController.swift
//  newApp
//
//  Created by MagdielG on 11/22/19.
//  Copyright © 2019 Magdiel Gómez. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class homeViewController: UIViewController {
    
    
    @IBOutlet weak var titleNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Perfil"
        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "Salir", style: .done, target: self, action: #selector(handleSignOutButtonTaped))
        
    }
    @objc func handleSignOutButtonTaped () {
        do {
            try Auth.auth().signOut()
        } catch let err {
            print(err)
        }
    }

        
        
        
    }
    


