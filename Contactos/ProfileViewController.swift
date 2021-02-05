

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var eliminar: UIButton!
    
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var oldPassword: underlined!
    @IBOutlet weak var confirmPassword: underlined!
    var user: User?
   
        override func viewDidLoad() {
    
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))

                view.addGestureRecognizer(tap)
            let api_token:String = UserDefaults.standard.string(forKey: "api_token")!
            print(api_token)
            
        let parameters : [String: String] = [
            
                "api_token":api_token
        ]
        let request = Request.shared.profileInfo(parameters: parameters)
        
        
        //username.text = api_token
        print("El api token es: ",api_token)
        request.response(completionHandler: { (response) in
            guard let data = response.data else {return}
            
                do{
                    print("Ha entrado al do")
                    self.user = try JSONDecoder().decode(User.self, from: data)
                    self.username.text = self.user!.username
                    
                    
                }catch{
                    print("Error decoding == \(error)")
                }
        })
            
           
        
    }
    
    @IBAction func eliminarCuenta(_ sender: Any) {
      
        let alert = UIAlertController(title: "Borrar usuario", message: "Estas seguro?", preferredStyle: .alert)
                       
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {action in self.deleteUSer()} ))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
       
        
    }
    
    @IBAction func changePassword(_ sender: Any) {
         let api_token:String = UserDefaults.standard.string(forKey: "api_token")!
        let parameters = [
            "password": oldPassword.text!,
            "new_password": newPassword.text!,
            "api_token": api_token
        ]
        
        
        if(oldPassword.text!.isEmpty || newPassword.text != " " || confirmPassword.text != " " ){
            print("entra al if")
            let request = Request.shared.changePassword(parameters: parameters)
            
            if(newPassword.text! == confirmPassword.text!){
            request.responseJSON { (response) in
               
                let alert = UIAlertController(title: "Contraseña cambiada", message: "Contraseña cambiada correctamente", preferredStyle: .alert)
                           
                           alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                           self.present(alert, animated: true, completion: nil)
                
            }
                
                }else{
                let alert = UIAlertController(title: "Algo salió mal", message: "Los campos no coinciden", preferredStyle: .alert)
                           
                           alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                           self.present(alert, animated: true, completion: nil)
            }
           
            }else{
            print("entra al else")
            let alert = UIAlertController(title: "Empty fields", message: "Complete the fields", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }

    func deleteUSer() {
         let api_token:String = UserDefaults.standard.string(forKey: "api_token")!
        let parameters = [
            
            "api_token": api_token
        ]
        let request = Request.shared.delete(parameters: parameters)
        request.responseJSON{response in
            let alert = UIAlertController(title: "Borrar usuario", message: "Estas seguro?", preferredStyle: .alert)
            UserDefaults.standard.removeObject(forKey: "api_token")
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {action in self.navigationController?.popToRootViewController(animated: true)} ))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
}
