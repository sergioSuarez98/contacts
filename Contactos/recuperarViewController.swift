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
    override func viewDidLoad() {
        super.viewDidLoad()
       sendButton.layer.cornerRadius = 7
    }

    @IBAction func recpverPassword(_ sender: Any) {
        
        let parameters : [String: String] = [
            
                       "username": email.text!
               ]
        Request.shared.restorePassword(parameters: parameters)
    }
}
