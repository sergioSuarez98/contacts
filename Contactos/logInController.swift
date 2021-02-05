

import UIKit

class logInController: UIViewController {
    @IBOutlet weak var logInController: UIButton!
    
    @IBOutlet weak var email: underlined!
    @IBOutlet weak var contraseña: underlined!
   
     
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.removeObject(forKey: "api_token")
        logInController.layer.cornerRadius = 7
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @IBAction func goToMain(_ sender: Any) {
        /*navigationController?.setNavigationBarHidden(true, animated: true)*/
       
        let parameters : [String: String] = [
            
                "password": contraseña.text!,
                "username": email.text!
                   
        ]
               print(parameters)
            Request.shared.login(parameters: parameters).responseJSON{ response in
            
            let body = response.value as? String
            let bodySplitted = body?.split(separator: " ")
            let api_token = bodySplitted![1]
            
            
            
            
            if(response.value! as! String != "Wrong user or password" && response.value! as! String != "No user" ){
                self.performSegue(withIdentifier: "main", sender: sender)
                UserDefaults.standard.set(api_token, forKey: "api_token")
                print(UserDefaults.standard.string(forKey: "api_token")!)
                } else {
                let alertUser = UIAlertController(title: "Algo salió mal", message: "Usuario o contraseña no válidos", preferredStyle: .alert)
                alertUser.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertUser, animated: true, completion: nil)
            }
        }
            
        
    }
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
