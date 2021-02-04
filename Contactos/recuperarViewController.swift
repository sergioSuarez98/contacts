//
//  recuperarViewController.swift
//  Contactos
//
//  Created by alumnos on 01/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit

class recuperarViewController: UIViewController {
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var exito: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       sendButton.layer.cornerRadius = 7
    }

    @IBAction func recpverPassword(_ sender: Any) {
        
        let parameters : [String: String] = [
            
                       "username": email.text!,
                       "email" : email.text!
               ]
        Request.shared.restorePassword(parameters: parameters).responseJSON{ response in
            if(response.response?.statusCode == 200){
                print("Contraseña cambiada con exito")
                self.exito.isHidden = false
                self.email.text = " "
             
                
            } else {
                self.email.text = "Usuario no encontrado"
            }
        }
    
        
    }
}
