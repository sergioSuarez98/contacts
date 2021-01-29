

import UIKit

class logInController: UIViewController {
    @IBOutlet weak var logInController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       logInController.layer.cornerRadius = 7
    }
    @IBAction func goToMain(_ sender: Any) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
