

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var eliminar: UIButton!
    
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var oldPassword: underlined!
    var user: User?
        override func viewDidLoad() {
    
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))

                view.addGestureRecognizer(tap)
        let api_token:String = UserDefaults.standard.string(forKey: "api_token")!
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
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }


}
