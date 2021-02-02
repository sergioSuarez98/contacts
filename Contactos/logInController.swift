

import UIKit

class logInController: UIViewController {
    @IBOutlet weak var logInController: UIButton!
    
    @IBOutlet weak var email: underlined!
    @IBOutlet weak var contraseña: underlined!
    override func viewDidLoad() {
        super.viewDidLoad()
       logInController.layer.cornerRadius = 7
    }
    @IBAction func goToMain(_ sender: Any) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        let parameters : [String: String] = [
            
                "pass": contraseña.text!,
                "user": email.text!
                   
        ]
               print(parameters)
        Request.shared.login(parameters: parameters)
            
        
    }
}
