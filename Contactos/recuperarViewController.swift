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
            
                      
                       "email" : email.text!
               ]
        Request.shared.restorePassword(parameters: parameters).responseJSON{ response in
            if(response.value! as! String != "Wrong email"){
                print("Contraseña cambiada con exito")
                
                self.email.text = " "
                let alertNewPassword = UIAlertController(title: "Contraseña cambiada!", message: response.value! as? String, preferredStyle: .alert)
                
                alertNewPassword.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in self.performSegue(withIdentifier: "backToLogin", sender: sender)}))
                self.present(alertNewPassword, animated: true, completion: nil)
             
                
            } else {
               let alertNewPassword = UIAlertController(title: "Algo ha salido mal!", message: response.value! as? String, preferredStyle: .alert)
                
                alertNewPassword.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertNewPassword, animated: true, completion: nil)
            }
        }
    
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
