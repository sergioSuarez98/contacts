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
    let alert = UIAlertController(title: "Algo salió mal", message: "Las contraseñas no coinciden", preferredStyle: .alert)
    let alertEmail = UIAlertController(title: "Algo salió mal", message: "Email no valido", preferredStyle: .alert)
    @IBOutlet weak var confirmarPassword: underlined!
    @IBOutlet weak var registrarseButton: UIButton!
    @IBOutlet weak var contraseña: underlined!
    override func viewDidLoad() {
        super.viewDidLoad()
        registrarseButton.layer.cornerRadius = 7
    }
    
    @IBAction func validar(_ sender: Any) {
        
        if(isValidEmail(email.text ?? " ")){
        if(confirmarPassword.text == contraseña.text ){
           
            if let secondVc = storyboard?.instantiateViewController(withIdentifier: "Second") {
                navigationController?.pushViewController(secondVc, animated: true)
            }
        }else{
            print("email no valido")
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
        }else{
            print("Deberia salir error de email")
            alertEmail.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

            // 4. Present the alert.
            self.present(alertEmail, animated: true, completion: nil)
        }
        
        let parameters : [String: String] = [
            "pass": contraseña.text!,
            "user": email.text!
            
        ]
        print(parameters)
        //postRequest()
        AF.request("https://superapi.netlify.app/api/register", method: .post		, parameters: parameters, encoding: JSONEncoding() as ParameterEncoding).response{response in debugPrint(response)}
        /*let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let parameterEncoder = JSONParameterEncoder(encoder: encoder)*/
    }
    
    func isValidEmail(_ email: String) -> Bool {			
        /*let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)*/
        return true//emailPred.evaluate(with: email)
    }
    
    /*func postRequest(){
        var sURL :String!
        sURL = "https://superapi.netlify.app/api/register"
        let serializer = DataResponseSerializer(emptyResponseCodes: Set([200,204,205]))
        var sampleRequest = URLRequest(url:URL(string: sURL)!)
        sampleRequest.httpMethod = HTTPMethod.post.rawValue
        
        
        AF.request(sampleRequest).uploadProgress{progress in}.response(responseSerializer: serializer){response in}
        
    }*/

}

