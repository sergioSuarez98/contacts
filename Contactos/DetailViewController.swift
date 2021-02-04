

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var email: UILabel!
    var userData: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(userData?.username)
        user.text = userData?.username
        name.text = userData?.name
        surname.text = userData?.surname
        email.text = userData?.email
    }
    

    

}
