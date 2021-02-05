//
//  ViewController.swift
//  Contactos
//
//  Created by alumnos on 27/01/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var email: underlined!
    
    let alertEmail = UIAlertController(title: "Algo salió mal", message: "Email no valido", preferredStyle: .alert)
    @IBOutlet weak var confirmarPassword: underlined!
    @IBOutlet weak var registrarseButton: UIButton!
    @IBOutlet weak var contraseña: underlined!
    @IBOutlet weak var name: underlined!
    @IBOutlet weak var surname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        registrarseButton.layer.cornerRadius = 7
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))
               view.addGestureRecognizer(tap)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false	, animated: true)
    }
    
    @IBAction func validar(_ sender: Any) {
        
        if(isValidEmail(email.text ?? " ")){
        
           
            if let secondVc = storyboard?.instantiateViewController(withIdentifier: "Second") {
                navigationController?.pushViewController(secondVc, animated: true)
            }
        
        
        }else{
            print("Deberia salir error de email")
            alertEmail.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

            // 4. Present the alert.
            self.present(alertEmail, animated: true, completion: nil)
        }
        
       
        let user = User.init(username: confirmarPassword.text!, email: email.text!, name:  name.text!, surname: surname.text!, profilePic: email.text!,password: contraseña.text!)
        Request.shared.registerUser(user: user)
        print(user)
    }
    
    func isValidEmail(_ email: String) -> Bool {			
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

